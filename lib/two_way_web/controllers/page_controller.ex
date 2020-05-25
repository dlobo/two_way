defmodule TwoWayWeb.PageController do
  use TwoWayWeb, :controller

  use TwoWay.Commnunication

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def hook(conn, params) do
    IO.inspect(params)
    json(conn, nil)
  end

  def handle(data, conn) do
    case data do
      {:ok, message} ->  json(conn, message)
      {:error, message} ->  json(conn, message)
      true -> json(conn, [])
    end
  end

  def test(conn, _params) do

    # TwoWay.Commnunication.fire(:send_message, "Hello from Communication", "919917443994")
    # data = communication(:send_message, "Heio from Communication", "919917443994")
    data = send_message("Hello from send", "919917443994")
    handle(data, conn)
  end
end
