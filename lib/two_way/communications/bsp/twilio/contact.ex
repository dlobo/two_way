defmodule TwoWay.Communications.BSP.Twilio.Contact do
  @behaviour TwoWay.Communications.ContactBehaviour

  @impl TwoWay.Communications.ContactBehaviour
  def status(_args) do
    {:ok, :status}
  end
end
