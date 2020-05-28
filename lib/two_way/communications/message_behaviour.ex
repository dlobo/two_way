defmodule TwoWay.Communications.MessageBehaviour do
  @doc """
  Invoked when a request runs.

  ## Arguments

  - `payload` - payload for the event
  - `destination` - destination number for communication
  """

  @callback send_message(
    message :: TwoWay.Messages.Message.t()
  ) :: {:ok, response :: map()} | {:error, message :: String.t()}

  @callback send_text(
              message :: TwoWay.Messages.Message.t(),
              receiver :: String.t(),
              sender :: map()
            ) :: {:ok, response :: map()} | {:error, message :: String.t()}

  @callback receive_text(payload :: map()) ::
              {message :: map(), contact :: map()}

  @callback receive_image(payload :: map()) ::
              {message :: map(), contact :: map()}
end
