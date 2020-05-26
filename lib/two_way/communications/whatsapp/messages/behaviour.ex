defmodule TwoWay.WhatsApp.MessageBehaviour do
  @doc """
  Invoked when a request runs.

  ## Arguments

  - `payload` - payload for the event
  - `destination` - destination number for communication
  """

  @callback send_message(payload :: Map.t(), sender :: String.t(), receiver :: String.t() ) :: {:ok, response :: Map.t()} | {:error, message :: String.t()}

  @callback send_video_message(payload :: Map.t(), sender :: String.t(), receiver :: String.t() ) :: {:ok, response :: Map.t()} | {:error, message :: String.t()}

  @callback send_image_message(payload :: Map.t(), sender :: String.t(), receiver :: String.t() ) :: {:ok, response :: Map.t()} | {:error, message :: String.t()}

  @callback send_file_message(payload :: Map.t(), sender :: String.t(), receiver :: String.t() ) :: {:ok, response :: Map.t()} | {:error, message :: String.t()}


end
