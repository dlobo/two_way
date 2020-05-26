defmodule TwoWay.WhatsApp.Contacts do

  @spec __using__(any) ::
          {:use, [{:context, TwoWay.Commnunication} | {:import, Kernel}, ...], [...]}
  defmacro __using__(opts \\ []) do
    quote do
    end
  end


  def effective_bsp() do
    bsp = with nil <- bsp_per_organisation(),
         nil <- bsp_from_config(),
         do: bsp_default()

    String.to_existing_atom(to_string(bsp) <> ".Messages")
  end

  def effective_sender() do
    with nil <- sender_per_organisation(),
         nil <- sender_from_config(),
         do: sender_default()
  end

  defp bsp_per_organisation(), do: nil

  defp bsp_from_config() do
    nil
    # case Application.get_env(:two_way, :bsp, nil) do
    #   nil -> nil
    #   provider -> provider
    # end
  end

  defp bsp_default(), do: TwoWay.WhatsApp.BSP.Gupshup

  defp sender_per_organisation(), do: nil

  defp sender_from_config(), do: nil

  defp sender_default() do
    # For sendbox only
    %{"source" => "917834811114", "src.name" => "NGO Name"}
  end
end
