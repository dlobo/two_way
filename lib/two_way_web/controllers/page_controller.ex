defmodule TwoWayWeb.PageController do
  use TwoWayWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def hook(conn, params) do
    json(conn, nil)
  end

  def handle(data, conn) do
    case data do
      {:ok, message} -> json(conn, message)
      {:error, message} -> json(conn, message)
      _ -> json(conn, data)
    end
  end

  def test(conn, _params) do
    handle([], conn)
  end
end
