defmodule TwoWay.Commnunication.BSP.Gupshup.Contact do

  @behaviour TwoWay.Communication.ContactBehaviour

  @impl TwoWay.Communication.ContactBehaviour
  def status(_args) do
    {:ok, :status}
  end

end
