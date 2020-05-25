defmodule TwoWay.Communications.Builder do
 @doc """
  Invoked when a request runs.

  Build all the injections and helper functions for the communication
  """
  defmacro __using__(_opts \\ []) do
    quote do

      @bsp TwoWay.Commnunication.effective_bsp()
      @sender TwoWay.Commnunication.effective_sender()

      def send_message(payload, receiver) do
        apply(@bsp, :send_message, [payload, @sender, receiver])
      end

    end
  end

end
