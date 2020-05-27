defmodule TwoWay.Communication.Message do

  defmacro __using__(_opts \\ []) do
    quote do
    end
  end

  def send_text(message, contact) do
    effective_bsp()
    |> apply( :send_text, [message, contact, effective_sender()])
  end

  def receive_text(payload) do
    {_message, _contact} = effective_bsp() |> apply( :receive_text, [payload])
    # save this to message Structure
  end

  def effective_bsp() do
    bsp = TwoWay.Commnunication.effective_bsp()
    String.to_existing_atom(to_string(bsp) <> ".Message")
  end

  def effective_sender() do
    TwoWay.Commnunication.effective_sender()
  end

end
