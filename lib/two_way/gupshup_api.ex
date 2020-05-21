defmodule TwoWay.GupshupApi do
  def make_call(payload, destination) do

    request_body =
      %{"channel" => "whatsapp"}
      |> Map.merge(get_source)
      |> Map.put(:destination, destination)
      |> Map.put("message", "Hello")
      |> Poison.encode!

    url = System.get_env("GUPSHUP_API_URL") || "https://api.gupshup.io/sm/api/v1/msg"
    response = HTTPoison.post(url, request_body, get_headers())
    IO.inspect(response)

    # case Mojito.post(url, get_headers(), Jason.encode!(request_body),
    #        opts: [transport_opts: [verify: :verify_none]]
    #      ) do
    #   {:ok, response} -> success_response(response)
    #   {:error, error} -> failed_response(error)
    # end
  end

  def success_response(response) do
    IO.inspect(response)
  end

  def failed_response(error) do
    IO.inspect(error)
  end

  def message(payload, destination) do
    # validate_payload(message, "message")
    make_call(payload, destination)
  end

  def image(payload, destination) do
    make_call(payload, destination)
  end

  def file(payload, destination) do
    make_call(payload, destination)
  end

  def video(payload, destination) do
    make_call(payload, destination)
  end

  def audio(payload, destination) do
    make_call(payload, destination)
  end

  def template(payload, destination) do
    make_call(payload, destination)
  end

  def location(payload, destination) do
    make_call(payload, destination)
  end

  def contact(payload, destination) do
    make_call(payload, destination)
  end

  def get_source() do
    %{"source" => "917834811114", "src.name" => "NGO Name"}
  end

  def get_headers() do
    [
      {"content-type", "application/x-www-form-urlencoded"},
      {"apikey", System.get_env("GUPSHUP_API_KEY") || "380a3225dc604909c9cb8406c7d49f75"}
    ]
  end
end
