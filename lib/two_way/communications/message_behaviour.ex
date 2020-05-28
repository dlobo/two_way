defmodule TwoWay.Communications.MessageBehaviour do
  @doc """
  Invoked when a request runs.

  ## Arguments

  - `payload` - payload for the event
  - `destination` - destination number for communication
  """

  @callback send_text(
              message :: TwoWay.Messages.Message.t(),
              receiver :: String.t(),
              sender :: Map.t()
            ) :: {:ok, response :: Map.t()} | {:error, message :: String.t()}

  @callback receive_text(payload :: Map.t()) ::
              {message :: Map.t(), contact :: Map.t()}
end
