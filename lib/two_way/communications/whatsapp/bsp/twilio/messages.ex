defmodule TwoWay.WhatsApp.BSP.Twilio.Messages do

  @behaviour TwoWay.WhatsApp.MessageBehaviour
  alias TwoWay.Communicatios.BSP.Gupshup.ApiClient, as: ApiClient


  @impl TwoWay.WhatsApp.MessageBehaviour
  def send_message(_payload, _sender, _receiver) do
    {:ok, "Sent messages form Twilio"}
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
