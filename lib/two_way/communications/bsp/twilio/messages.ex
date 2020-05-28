defmodule TwoWay.Commnunications.BSP.Twilio.Message do
  @behaviour TwoWay.Communications.MessageBehaviour

  @impl TwoWay.Communications.MessageBehaviour
  def send_text(_payload, _receiver, _sender), do: {:ok, "Message sent via twilio"}

  @impl TwoWay.Communications.MessageBehaviour
  def send_message(_payload) do
  end

  @impl TwoWay.Communications.MessageBehaviour
  def receive_text(_payload), do: {:message, :contact}

  @impl TwoWay.Communications.MessageBehaviour
  def receive_image(_payload), do: {:message, :contact}
end
