defmodule TwoWay.Communications.MessageBehaviour do
  @doc """
  Invoked when a request runs.

  ## Arguments

  - `payload` - payload for the event
  - `destination` - destination number for communication
  """

  @callback send_text(message :: TwoWay.Messages.Message.t()) ::
              {:ok, response :: map()} | {:error, message :: String.t()}

  @callback send_image(message :: TwoWay.Messages.Message.t()) ::
              {:ok, response :: map()} | {:error, message :: String.t()}

  @callback send_audio(message :: TwoWay.Messages.Message.t()) ::
              {:ok, response :: map()} | {:error, message :: String.t()}

  @callback send_video(message :: TwoWay.Messages.MessageMedia.t()) ::
              {:ok, response :: map()} | {:error, message :: String.t()}

  @callback send_document(message :: TwoWay.Messages.MessageMedia.t()) ::
              {:ok, response :: map()} | {:error, message :: String.t()}

  @callback receive_text(payload :: map()) ::
              {message :: map(), contact :: map()}

  @callback receive_media(payload :: map()) ::
              {message :: map(), contact :: map()}
end
