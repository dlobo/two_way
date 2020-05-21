defmodule TwoWay.GupshupApi do
  @apiurl "https://api.gupshup.io/sm/api/v1/msg"

  @headers [
    {"content-type", "application/x-www-form-urlencoded"},
    {"apikey", "380a3225dc604909c9cb8406c7d49f75"},
    {"Cache-Control", "no-cache"}
  ]

  @request_body %{:channel => :whatsapp}


  def make_call(payload, destination) do
    headers = @headers

    request_body =
      @request_body
      |> Map.merge(get_source)
      |> Map.put(:destination, destination)
      |> Map.put("message.payload", payload)

    case Mojito.request(:post, @apiurl, @headers, URI.encode_query(request_body)) do
      {:ok, response} -> success_response(response)
      {:error, error} -> failed_response(error)
    end
  end

  def success_response(response) do
    IO.inspect(response)
  end

  def failed_response(error) do
    IO.inspect(response)
  end

  def get_source() do
    %{:source => "917834811114", "src.name" => "NGO Name"}
  end

  def message(message, destination) do
    make_call(message, destination)
  end

  def image(message, destination) do
    make_call(message, destination)
  end

  def file(message, destination) do
    make_call(message, destination)
  end

  def video(message, destination) do
    make_call(message, destination)
  end

  def audio(message, destination) do
    make_call(message, destination)
  end

  def template(message, destination) do
    make_call(message, destination)
  end

  def location(message, destination) do
    make_call(message, destination)
  end

  def contact(message, destination) do
    make_call(message, destination)
  end
end
