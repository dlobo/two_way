defmodule TwoWay.WhatsApp.Message do

  alias TwoWay.Commnunication

  defmacro __using__(opts \\ []) do
    quote do
      use TwoWay.WhatsApp.MessageBuilder, unquote(opts)
    end
  end

  def effective_bsp() do
    bsp = TwoWay.Commnunication.effective_whats_app_bsp()
    String.to_existing_atom(to_string(bsp) <> ".Messages")
  end

  def effective_sender() do
    TwoWay.Commnunication.effective_whats_app_sender()
  end

end
