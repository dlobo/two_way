defmodule TwoWay.Commnunications.BSP.Gupshup.Message do
  @channel "whatsapp"
  @behaviour TwoWay.Communications.MessageBehaviour

  alias TwoWay.Commnunications.BSP.Gupshup.ApiClient, as: ApiClient

  @impl TwoWay.Communications.MessageBehaviour
  def send_text(payload, receiver, sender) do
    request_body =
      %{"channel" => @channel}
      |> Map.merge(sender)
      |> Map.put(:destination, receiver)
      |> Map.put("message", payload["body"])

    data = ApiClient.post("/msg", request_body)
    {:ok, data}
  end

  @impl TwoWay.Communications.MessageBehaviour
  def receive_text(params) do
    payload = params["payload"]
    message_payload = payload["payload"]

    message_params = %{
      wa_message_id: payload["id"],
      body: message_payload["text"]
    }

    contact_params = %{
      phone: payload["sender"]["phone"],
      name: payload["sender"]["name"]
    }

    {message_params, contact_params}
  end

  @impl TwoWay.Communications.MessageBehaviour
  def receive_image(params) do
    payload = params["payload"]
    message_payload = payload["payload"]

    message_params = %{
      wa_message_id: payload["id"],
      caption: message_payload["caption"],
      url: message_payload["url"]
    }

    contact_params = %{
      phone: payload["sender"]["phone"],
      name: payload["sender"]["name"]
    }

    {message_params, contact_params}
  end
end
