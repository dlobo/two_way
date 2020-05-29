defmodule TwoWay.Communications.Message do
  alias TwoWay.Messages
  alias TwoWay.Contacts

  @media_message_types [:image, :audio, :video, :document]

  defmacro __using__(_opts \\ []) do
    quote do
    end
  end

  def send_message(message) do
    cond do
      message.type == :text -> send_text(message) |> handle_send_message_response(message)
      message.type in @media_message_types -> send_media(message) |> handle_send_message_response(message)
    end
  end

  # def send_message(message) when message.type == :text do
  #   send_text(message) |> handle_send_message_response(message)
  # end

  # def send_message(message) when message.type in @media_message_types do
  #    send_media(message) |> handle_send_message_response(message)
  # end

  # def send_message(_message), do: nil


  defp send_text(message) do
    bsp_module()
    |> apply(:send_text, [message, message.recipient.phone, message.sender])
  end

  defp send_media(message) do
    case message.type do
       :image -> bsp_module()
        |> apply(:send_image, [message.media, message.recipient.phone, message.sender])

       :audio -> bsp_module()
          |> apply(:send_audio, [message.media, message.recipient.phone, message.sender])

        :video -> bsp_module()
          |> apply(:send_video, [message.media, message.recipient.phone, message.sender])

        :document -> bsp_module()
          |> apply(:send_document, [message.media, message.recipient.phone, message.sender])
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

  defp handle_send_message_response(response, message) do
    message
    |> Messages.update_message(%{wa_message_id: response.message_id, wa_status: :sent})
  end
end
