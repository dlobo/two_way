defmodule TwoWay.Communications.Message do
  alias TwoWay.Messages
  alias TwoWay.Contacts

  defmacro __using__(_opts \\ []) do
    quote do
    end
  end

  def send_text(message, receipient) do
    bsp_module()
    |> apply(:send_text, [message, receipient, organisation_contact()])
  end

  def receive_text(payload) do
    {message_params, contact_params} =
      bsp_module()
      |> apply(:receive_text, [payload])

    contact = Contacts.find_or_create(contact_params)

    {:ok, message } = message_params
    |> Map.put(:type, :text)
    |> Map.put(:sender_id, contact.id)
    # TODO: Make this dynamic
    |> Map.put(:recipient_id, 1)
    |> Messages.create_inbound_message()

    {contact, message }
  end

  def bsp_module() do
    bsp = TwoWay.Commnunications.effective_bsp()
    String.to_existing_atom(to_string(bsp) <> ".Message")
  end

  def organisation_contact() do
    TwoWay.Commnunications.organisation_contact()
  end
end
