defmodule TwoWay.WhatsApp.BSP.Gupshup.Messages do

  @channel "whatsapp"
  @behaviour TwoWay.WhatsApp.MessageBehaviour
  alias TwoWay.WhatsApp.BSP.Gupshup.ApiClient, as: ApiClient


  @impl TwoWay.WhatsApp.MessageBehaviour
  def send_message(payload, sender, receiver) do
    request_body =
      %{"channel" => @channel}
      |> Map.merge(sender)
      |> Map.put(:destination, receiver)
      |> Map.put("message", payload[:text])

    data = ApiClient.post("/msg", request_body)
    {:ok, "Message sent from Gupshup"}
  end

  @impl TwoWay.WhatsApp.MessageBehaviour
  defp send_video_message(_payload, _sender, _receiver) do
  end

  @impl TwoWay.WhatsApp.MessageBehaviour
  defp send_image_message(_payload, _sender, _receiver) do
  end

  @impl TwoWay.WhatsApp.MessageBehaviour
  defp send_file_message(_payload, _sender, _receiver) do
  end

end
