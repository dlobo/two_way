defmodule TwoWay.Communications.BSP.Twilio do

  @behaviour TwoWay.Communications.BSP
  # alias TwoWay.Communicatios.BSP.Twilio.ApiClient, as: ApiClient

  @impl TwoWay.Communications.BSP
  def send_message(payload, _sender, _receiver) do
    case payload[:type] do
        _ -> {:error, "Invalid Type from twilio"}
    end
  end

end
