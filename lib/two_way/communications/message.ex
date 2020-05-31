defmodule TwoWay.Communications.Message do
  alias TwoWay.Messages
  alias TwoWay.Messages.Message
  alias TwoWay.Contacts

  defmacro __using__(_opts \\ []) do
    quote do
    end
  end

  def send_message(%Message{type: :text} = message) do
    message
    |> send_text()
  end

  def send_message(message) do
    message
    |> send_media()
  end

  defp send_text(message) do
    bsp_module()
    |> apply(:send_text, [message])
  end

  defp send_media(message) do
    case message.type do
      :image ->
        bsp_module()
        |> apply(:send_image, [message])

      :audio ->
        bsp_module()
        |> apply(:send_audio, [message])

      :video ->
        bsp_module()
        |> apply(:send_video, [message])

      :document ->
        bsp_module()
        |> apply(:send_document, [message])
    end
  end

  def receive_text(message_params) do
    contact = Contacts.get_or_create(message_params.sender)

    message_params
    |> Map.merge(%{
      type: :text,
      sender_id: contact.id,
      recipient_id: get_recipient_id_for_inbound()
    })
    |> Messages.create_message()
  end

  def receive_media(message_params) do
    contact = Contacts.get_or_create(message_params.sender)
    {:ok, message_media} = Messages.create_message_media(message_params)

    message_params
    |> Map.merge(%{
      sender_id: contact.id,
      media_id: message_media.id,
      recipient_id: get_recipient_id_for_inbound()
    })
    |> Messages.create_message()
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
