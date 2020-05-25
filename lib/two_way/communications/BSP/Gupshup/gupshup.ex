defmodule TwoWay.Communications.BSP.Gupshup do

  @channel "whatsapp"
  @behaviour TwoWay.Communications.BSP
  alias TwoWay.Communicatios.BSP.Gupshup.ApiClient, as: ApiClient


  @impl TwoWay.Communications.BSP
  def call(method, payload, destination) do
     make_call(method, payload, destination)
  end

  defp make_call(:send_message, payload, destination) do
    request_body =
      %{"channel" => @channel}
      |> Map.merge(get_source())
      |> Map.put(:destination, destination)
      |> Map.put("message", payload)

    data = ApiClient.post("/msg", request_body)
    {:ok, "message sent from gupshup"}
  end

  defp make_call(_method, _payload, _destination) do
    {:error, "Method not defined"}
  end

  defp get_source() do
    %{"source" => "917834811114", "src.name" => "NGO Name"}
  end

end
