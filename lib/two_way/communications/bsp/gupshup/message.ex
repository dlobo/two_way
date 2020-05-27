defmodule TwoWay.Commnunication.BSP.Gupshup.Message do

  @channel "whatsapp"
  @behaviour TwoWay.Communication.MessageBehaviour

  alias TwoWay.Commnunication.BSP.Gupshup.ApiClient, as: ApiClient

  @impl TwoWay.Communication.MessageBehaviour
  def send_text(payload, receiver, sender) do
    request_body =
      %{"channel" => @channel}
      |> Map.merge(sender)
      |> Map.put(:destination, receiver)
      |> Map.put("message", payload[:body])

    data = ApiClient.post("/msg", request_body)
    {:ok, data}
  end

  @impl TwoWay.Communication.MessageBehaviour
  def receive_text(_payload) do
    {:message, :contact}
  end


end
