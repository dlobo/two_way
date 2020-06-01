defmodule TwoWay.Communications.BSP.Gupshup.Worker do
  use Oban.Worker,
    queue: :gupshup,
    max_attempts: 3,
    priority: 0

  alias TwoWay.Communications.BSP.Gupshup.ApiClient
  alias TwoWay.{Messages, Messages.Message}

  @rate_name  Application.fetch_env!(:two_way, :bsp_id)
  @rate_limit Application.fetch_env!(:two_way, :bsp_limit)

  @impl Oban.Worker
  def perform(%{"message" => message, "payload" => payload}, _job) do
    # ensure that we are under the rate limit, all rate limits are in requests/minutes
    with {:ok, _} <- ExRated.check_rate(@rate_name, 60_000, @rate_limit) do
      response =
        ApiClient.post("/msg", payload)
        |> handle_response()

      Poison.Decode.decode(message, as: %Message{})
      |> Messages.update_message(%{wa_message_id: response.message_id, wa_status: :enqueued})

      :ok
    else
      _ -> {:error, :rate_limit_exceeded}
    end
  end

  defp handle_response(response_data) do
    {:ok, response} = response_data
    body = response.body |> Jason.decode!()
    %{message_id: body["messageId"]}
  end

  @impl Oban.Worker
  def backoff(attempt) do
    # We backoff exponentially but always delay by at least 60 seconds
    # this needs more work and tweaking
    :math.pow(attempt, 4) + 60 + :rand.uniform(30) * attempt
  end

end
