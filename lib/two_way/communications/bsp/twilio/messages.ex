defmodule TwoWay.Commnunications.BSP.Twilio.Message do
  @behaviour TwoWay.Communications.MessageBehaviour

  @impl TwoWay.Communications.MessageBehaviour
  def send_text(_message, _receiver, _sender), do: {:ok, :response}

  @impl TwoWay.Communications.MessageBehaviour
  def send_image(_message_media, _receiver, _sender), do: {:ok, :response}

  @impl TwoWay.Communications.MessageBehaviour
  def send_audio(_message_media, _receiver, _sender), do: {:ok, :response}

  @impl TwoWay.Communications.MessageBehaviour
  def send_video(_message_media, _receiver, _sender), do: {:ok, :response}

 @impl TwoWay.Communications.MessageBehaviour
  def send_document(_message_media, _receiver, _sender), do: {:ok, :response}

  @impl TwoWay.Communications.MessageBehaviour
  def receive_text(_payload), do: {:message, :contact}

  @impl TwoWay.Communications.MessageBehaviour
  def receive_media(_payload), do: {:message, :contact}
end
