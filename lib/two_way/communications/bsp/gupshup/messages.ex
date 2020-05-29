defmodule TwoWay.Commnunications.BSP.Gupshup.Message do
  @channel "whatsapp"
  @behaviour TwoWay.Communications.MessageBehaviour

  alias TwoWay.Commnunications.BSP.Gupshup.ApiClient, as: ApiClient

  @impl TwoWay.Communications.MessageBehaviour
  def send_text(message, receiver, sender) do
    %{type: :text, text: message.body}
    |> send(receiver, sender)
    |> handle_response()
  end

  @impl TwoWay.Communications.MessageBehaviour
  def send_image(message_media, receiver, sender) do
    %{
      type: :image,
      originalUrl: message_media.source_url,
      previewUrl: message_media.url,
      caption: message_media.caption
    }

    |> send(receiver, sender)
    |> handle_response()
  end

  @impl TwoWay.Communications.MessageBehaviour
  def send_audio(message_media, receiver, sender) do
    %{
      type: :audio,
      url: message_media.source_url
    }
    |> send(receiver, sender)
    |> handle_response()
  end

  @impl TwoWay.Communications.MessageBehaviour
  def send_video(message_media, receiver, sender) do
    %{
      type: :audio,
      url: message_media.source_url,
      caption: message_media.caption
    }
    |> send(receiver, sender)
    |> handle_response()
  end

 @impl TwoWay.Communications.MessageBehaviour
  def send_document(message_media, receiver, sender) do
    %{
      type: :file,
      url: message_media.source_url,
      filename: message_media.caption
    }
    |> send(receiver, sender)
    |> handle_response()
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

  defp send(message_payload, receiver, sender) do
    request_body =
      %{"channel" => @channel}
      |> Map.merge(format_sender(sender))
      |> Map.put(:destination, receiver)
      |> Map.put("message", Jason.encode!(message_payload))

    ApiClient.post("/msg", request_body)
  end

  defp handle_response(response_data) do
    {:ok, response} = response_data
    body = response.body |> Jason.decode!()
    %{message_id: body["messageId"]}
  end
end
