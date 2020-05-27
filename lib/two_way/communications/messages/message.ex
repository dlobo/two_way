defmodule TwoWay.Communication.Message do
  alias TwoWay.Messages
  alias TwoWay.Contacts

  defmacro __using__(_opts \\ []) do
    quote do
    end
  end

  def send_text(message, contact) do
    effective_bsp()
    |> apply(:send_text, [message, contact, effective_sender()])
  end

  def receive_text(payload) do
    {message_params, _contact_params} = effective_bsp() |> apply(:receive_text, [payload])

    message_params =
      message_params
      |> Map.put(:flow, "inbound")
      |> Map.put(:type, :text)
      |> Map.put(:sender_id, 1)
      |> Map.put(:recipient_id, 1)
      |> Map.put(:wa_status, "received")

    message = Messages.create_message(message_params)
    # contact  = Contacts.create_contact(contact_params)
  end

  def effective_bsp() do
    bsp = TwoWay.Commnunication.effective_bsp()
    String.to_existing_atom(to_string(bsp) <> ".Message")
  end

  def effective_sender() do
    TwoWay.Commnunication.effective_sender()
  end
end
