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

  def test(conn, _params) do
    data = communication(:send_message, "Heio from Communication", "919917443994")
    IO.inspect(data)
    case data do
      {:ok, message} ->  json(conn, message)
      true -> json(conn, [])
    end

  end
end
