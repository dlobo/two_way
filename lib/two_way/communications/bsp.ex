defmodule TwoWay.Communications.BSP do
  @doc """
  Invoked when a request runs.

  ## Arguments

  - `payload` - payload for the event
  - `destination` - destination number for communication
  """

  # @callback call(method :: String.t(), payload :: Map.t(), destination :: String.t() ) :: {:ok, response :: Map.t()} | {:error, message :: String.t()}
  @callback send_message(payload :: Map.t(), sender :: String.t(), receiver :: String.t() ) :: {:ok, response :: Map.t()} | {:error, message :: String.t()}


end
