defmodule TwoWay.Communications.BSP.Twilio do
  alias TwoWay.Communicatios.BSP.Twilio.ApiClient, as: ApiClient

  def call(_method, payload, destination) do
     make_call(payload, destination)
     IO.puts("Message sent from Twilio")
     {:ok, "Fire event from Twilio"}
  end

  defp make_call(_payload, _destination) do

  end


end
