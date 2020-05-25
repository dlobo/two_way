defmodule TwoWay.Communications.BSP.Gupshup do
  alias TwoWay.Communicatios.BSP.Gupshup.ApiClient, as: ApiClient

  def call(_method, payload, destination) do
     make_call(payload, destination)
     IO.puts("Message sent from Gupshup")
     {:ok, "Fire event from gupshup"}
  end

  defp make_call(payload, destination) do
    request_body =
      %{"channel" => "whatsapp"}
      |> Map.merge(get_source())
      |> Map.put(:destination, destination)
      |> Map.put("message", payload)

    data = ApiClient.post("/msg", request_body)
    {:ok, "message sent from gupshup"}
  end

  defp get_source() do
    %{"source" => "917834811114", "src.name" => "NGO Name"}
  end
end
