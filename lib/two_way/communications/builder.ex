defmodule TwoWay.Communications.Builder do

  defmacro __using__(_opts \\ []) do
    quote do
      def communication(event, payload, destination) do
        TwoWay.Commnunication.fire(event, payload, destination)
      end
    end
  end

end
