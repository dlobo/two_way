defmodule TwoWay.Communications.BSP.Gupshup.Message do
  @channel "whatsapp"
  @behaviour TwoWay.Communications.MessageBehaviour

  alias TwoWay.Communications.BSP.Gupshup.Worker
  alias TwoWay.Messages.Message

  @impl TwoWay.Communications.MessageBehaviour
  def send_text(message) do
    %{type: :text, text: message.body}
    |> send_message(message)
  end

  @impl TwoWay.Communications.MessageBehaviour
  def send_image(message) do
    message_media = message.media

    %{
      type: :image,
      originalUrl: message_media.source_url,
      previewUrl: message_media.url,
      caption: message_media.caption
    }
    |> send_message(message)
  end

  @impl TwoWay.Communications.MessageBehaviour
  def send_audio(message) do
    message_media = message.media

    %{
      type: :audio,
      url: message_media.source_url
    }
    |> send_message(message)
  end

  @impl TwoWay.Communications.MessageBehaviour
  def send_video(message) do
    message_media = message.media

    %{
      type: :audio,
      url: message_media.source_url,
      caption: message_media.caption
    }
    |> send_message(message)
  end

  @impl TwoWay.Communications.MessageBehaviour
  def send_document(message) do
    message_media = message.media

    %{
      type: :file,
      url: message_media.source_url,
      filename: message_media.caption
    }
    |> send_message(message)
  end

  @impl TwoWay.Communications.MessageBehaviour
  def receive_text(params) do
    payload = params["payload"]
    message_payload = payload["payload"]

    %{
      wa_message_id: payload["id"],
      body: message_payload["text"],
      sender: %{
        phone: payload["sender"]["phone"],
        name: payload["sender"]["name"]
      }
    }
  end

  @impl TwoWay.Communications.MessageBehaviour
  def receive_media(params) do
    payload = params["payload"]
    message_payload = payload["payload"]

    %{
      wa_message_id: payload["id"],
      caption: message_payload["caption"],
      url: message_payload["url"],
      sender: %{
        phone: payload["sender"]["phone"],
        name: payload["sender"]["name"]
      }
    }
  end

  defp format_sender(sender) do
    %{"source" => sender.phone, "src.name" => sender.name}
  end

  defp send_message(payload, message) do
    request_body =
      %{"channel" => @channel}
      |> Map.merge(format_sender(message.sender))
      |> Map.put(:destination, message.recipient.phone)
      |> Map.put("message", Jason.encode!(payload))

    %{message: Message.to_minimal_map(message), payload: request_body}
    |> Worker.new()
    |> Oban.insert()
  end
end
