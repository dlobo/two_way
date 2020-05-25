defmodule TwoWay.Communications.BSP.Twilio do

  @behaviour TwoWay.Communications.BSP
  # alias TwoWay.Communicatios.BSP.Twilio.ApiClient, as: ApiClient

  @impl TwoWay.Communications.BSP
  def call(method, payload, destination) do
     make_call(method, payload, destination)
  end

  defp make_call(:send_message, _payload, _destination) do
    # Send message via Twilio
    {:ok, "message sent from twilio"}
  end

  defp make_call(_method, _payload, _destination) do
    {:error, "Method not defined"}
  end

end
