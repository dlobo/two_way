defmodule TwoWay.Communications.BSP.Gupshup do

  @channel "whatsapp"
  @behaviour TwoWay.Communications.BSP
  alias TwoWay.Communicatios.BSP.Gupshup.ApiClient, as: ApiClient


  @impl TwoWay.Communications.BSP
  def send_message(payload, sender, receiver) do
    IO.inspect(payload[:type])
    case payload[:type] do
        :text -> send_text_message(payload, sender, receiver)
        :video -> send_video_message(payload, sender, receiver)
        _ -> {:error, "Invalid Type"}
    end
  end

  defp send_text_message(payload, sender, receiver) do
    request_body =
      %{"channel" => @channel}
      |> Map.merge(sender)
      |> Map.put(:destination, receiver)
      |> Map.put("message", payload[:text])

    ApiClient.post("/msg", request_body)
    {:ok, "Message sent from the gupshup"}
  end

  defp send_video_message(_payload, _sender, _receiver) do
    {:ok, "message vidoe via gupshup"}
  end

end
