defmodule TwoWay.Communications.BSP do
  @doc """
  Invoked when a request runs.

  ## Arguments

  - `method` - `method` event name for the api
  - `payload` - payload for the event
  - `destination` - destination number for communication
  """

  @callback call(method, payload, destination ) :: {:ok, response} | {:error, message}
end
