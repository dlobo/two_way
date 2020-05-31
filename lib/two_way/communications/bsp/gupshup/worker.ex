defmodule TwoWay.Communications.BSP.Gupshup.Worker do
  use Oban.Worker,
    queue: :gupshup,
    max_attempts: 10,
    priority: 1

  alias TwoWay.Communications.BSP.Gupshup.ApiClient
  alias TwoWay.Messages

  @impl Oban.Worker
  def perform(%{"message" => message, "payload" => payload}, _job) do
    response =
      ApiClient.post("/msg", payload)
      |> handle_response()

    message
    |> Messages.update_message(%{wa_message_id: response.message_id, wa_status: :enqueued})

    :ok
  end

  defp handle_response(response_data) do
    {:ok, response} = response_data
    body = response.body |> Jason.decode!()
    %{message_id: body["messageId"]}
  end
end
