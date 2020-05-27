defmodule TwoWay.Communication.Contact do

  defmacro __using__(_opts \\ []) do
    quote do
    end
  end

  def status(args) do
    effective_bsp()
    |> apply( :status, [args])
  end

  def effective_bsp() do
    bsp = TwoWay.Commnunication.effective_bsp()
    String.to_existing_atom(to_string(bsp) <> ".Contact")
  end

end
