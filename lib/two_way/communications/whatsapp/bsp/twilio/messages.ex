defmodule TwoWay.WhatsApp.BSP.Twilio.Messages do

  @behaviour TwoWay.WhatsApp.MessageBehaviour
  # alias TwoWay.WhatsApp.BSP.Twilio.ApiClient, as: ApiClient


  @impl TwoWay.WhatsApp.MessageBehaviour
  def send_message(_payload, _sender, _receiver) do
    {:ok, "Sent messages form Twilio"}
  end

  @impl TwoWay.WhatsApp.MessageBehaviour
  def send_video_message(_payload, _sender, _receiver) do
    {:ok, "Sent messages form Twilio"}
  end

  @impl TwoWay.WhatsApp.MessageBehaviour
  def send_image_message(_payload, _sender, _receiver) do
    {:ok, "Sent messages form Twilio"}
  end

  @impl TwoWay.WhatsApp.MessageBehaviour
  def send_file_message(_payload, _sender, _receiver) do
    {:ok, "Sent messages form Twilio"}
  end

end
