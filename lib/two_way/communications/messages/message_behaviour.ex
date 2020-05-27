defmodule TwoWay.Communication.MessageBehaviour do
  @doc """
  Invoked when a request runs.

  ## Arguments

  - `payload` - payload for the event
  - `destination` - destination number for communication
  """

  @callback send_text(message :: TwoWay.Messages.Message.t(), receiver :: String.t(), sender :: String.t() ) :: {:ok, response :: Map.t()} | {:error, message :: String.t()}

  @callback receive_text(payload :: Map.t()) :: {:ok, message :: String.t(), contact :: String.t()} | {:error, text :: String.t()}


end
