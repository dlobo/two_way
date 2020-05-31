defmodule TwoWay.Communications.BSP.Gupshup.Worker do
  use Oban.Worker,
    queue: :gupshup,
    max_attempts: 1,
    priority: 0

  alias TwoWay.Communications.BSP.Gupshup.ApiClient
  alias TwoWay.{Messages}

  @impl Oban.Worker
  def perform(%{"message" => message, "payload" => payload}, _job) do
    response =
      ApiClient.post("/msg", payload)
      |> handle_response()


    # We should be able to optimize this and avoid the get. I spend a fair bit of time
    # looking for libraries to convert maps to structs. there is: maptu, mapail and exconverter
    # all quite old and not maintained?
    Messages.get_message!(Map.get(message, "id"))
    |> Messages.update_message(%{wa_message_id: response.message_id, wa_status: :enqueued})

    :ok
  end

  defp handle_response(response_data) do
    {:ok, response} = response_data
    body = response.body |> Jason.decode!()
    %{message_id: body["messageId"]}
  end

end
