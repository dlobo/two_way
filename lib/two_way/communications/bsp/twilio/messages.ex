defmodule TwoWay.Commnunication.BSP.Twilio.Message do

  @channel "whatsapp"
  @behaviour TwoWay.Communication.MessageBehaviour

  alias TwoWay.Commnunication.BSP.Twilio.ApiClient, as: ApiClient

  @impl TwoWay.Communication.MessageBehaviour
  def send_text(_payload, _receiver, _sender), do: {:ok, "Message sent via twilio"}

  @impl TwoWay.Communication.MessageBehaviour
  def receive_text(_payload), do: {:message, :contact}

end
