defmodule TwoWay.Communications.Message do
  alias TwoWay.Messages
  alias TwoWay.Contacts

  defmacro __using__(_opts \\ []) do
    quote do
    end
  end

  def receive_text(payload) do
    {message_params, contact_params} =
      bsp_module()
      |> apply(:receive_text, [payload])

    contact = Contacts.find_or_create(contact_params)

    message_details = %{
      type: :text,
      sender_id: contact.id,
      recipient_id: get_recipient_id_for_inbound()
    }

    {:ok, message} =
      message_params
      |> Map.merge(message_details)
      |> Messages.create_inbound_message()

    {contact, message}
  end

  # I think this can be use as receive_media
  def receive_image(payload) do
    {message_params, contact_params} = bsp_module()
    |> apply(:receive_image, [payload])

    contact = Contacts.find_or_create(contact_params)
    {:ok, message_media} = Messages.create_message_media(message_params)

    message_details = %{
      type: :image,
      sender_id: contact.id,
      media_id: message_media.id,
      recipient_id: get_recipient_id_for_inbound()
    }

    {:ok, message} =
      message_params
      |> Map.merge(message_details)
      |> Messages.create_inbound_message()

    {contact, message}

  end

   # Will update this message soon
  def send_text(message, receipient) do
    bsp_module()
    |> apply(:send_text, [message, receipient, organisation_contact()])
  end

  def bsp_module() do
    bsp = TwoWay.Commnunications.effective_bsp()
    String.to_existing_atom(to_string(bsp) <> ".Message")
  end

  def organisation_contact() do
    TwoWay.Commnunications.organisation_contact()
  end

  def get_recipient_id_for_inbound() do
    # TODO: Make this dynamic
    1
  end
end
