defmodule TwoWay.Commnunication do

  def effective_bsp() do
    with nil <- bsp_per_organisation(),
         nil <- bsp_from_config(),
         do: bsp_default()
  end

  def effective_sender() do
    with nil <- sender_per_organisation(),
         nil <- sender_from_config(),
         do: sender_default()
  end

  defp bsp_per_organisation(), do: nil

  defp bsp_from_config() do
    case Application.get_env(:two_way, :bsp, nil) do
      nil -> nil
      provider -> provider
    end
  end

  defp bsp_default(), do: TwoWay.Commnunication.BSP.Twilio

  defp sender_per_organisation(), do: nil

  defp sender_from_config(), do: nil

  defp sender_default() do
    # For sendbox only
    %{"source" => "917834811114", "src.name" => "NGO Name"}
  end
end
