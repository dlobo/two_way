defmodule TwoWay.Commnunication do
  @spec __using__(any) ::
          {:use, [{:context, TwoWay.Commnunication} | {:import, Kernel}, ...], [...]}
  defmacro __using__(opts \\ []) do
    quote do
      use TwoWay.Communications.Builder, unquote(opts)
    end
  end

  @spec fire(any, any, any) :: any
  def fire(event, payload, destination) do
    effective_bsp().call(event, payload, destination)
  end

  @spec effective_bsp :: TwoWay.Communications.BSP.Gupshup
  def effective_bsp() do
    with nil <- bsp_per_organisation(),
         nil <- bsp_from_config(),
         do: bsp_default()
  end

  def bsp_per_organisation(), do: nil

  def bsp_from_config() do
    case Application.get_env(:two_way, :bsp, nil) do
      nil -> nil
      provider -> provider
    end
  end

  def bsp_default() do
    TwoWay.Communications.BSP.Twilio
  end
end