defmodule TwoWay.Communications.Message do
  alias TwoWay.Messages
  alias TwoWay.Contacts

  defmacro __using__(_opts \\ []) do
    quote do
    end
  end

  def send_message(message) do
    case message.type do
      :text ->
        send_text(message)
        |> handle_send_message_response(message)

      :image ->
        send_image(message)
        |> handle_send_message_response(message)

      :audio ->
        send_audio(message)
        |> handle_send_message_response(message)

      :video ->
        send_video(message)
        |> handle_send_message_response(message)

      _ ->
        send_document(message)
        |> handle_send_message_response(message)
    end
  end

  defp send_text(message) do
    bsp_module()
    |> apply(:send_text, [message, message.recipient.phone, message.sender])
  end

  defp send_image(message) do
    bsp_module()
    |> apply(:send_image, [message.media, message.recipient.phone, message.sender])
  end

  defp send_audio(message) do
    bsp_module()
    |> apply(:send_audio, [message.media, message.recipient.phone, message.sender])
  end

  defp send_video(message) do
    bsp_module()
    |> apply(:send_video, [message.media, message.recipient.phone, message.sender])
  end

  defp send_document(message) do
    bsp_module()
    |> apply(:send_docuemnt, [message.media, message.recipient.phone, message.sender])
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

  def receive_image(message_params) do
    contact = Contacts.get_or_create(message_params.sender)
    {:ok, message_media} = Messages.create_message_media(message_params)

    message_params
    |> Map.merge(%{
      type: :image,
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

  defp handle_send_message_response(response, message) do
    message
    |> Messages.update_message(%{wa_message_id: response.message_id, wa_status: :sent})
  end
end
