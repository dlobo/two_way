defmodule TwoWayWeb.PageController do
  use TwoWayWeb, :controller

  use TwoWay.WhatsApp.Message

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def hook(conn, params) do
    IO.inspect(params)
    json(conn, nil)
  end

  def handle(data, conn) do
    case data do
      {:ok, message} -> json(conn, message)
      {:error, message} -> json(conn, message)
      _ -> json(conn, [])
    end
  end

  def test(conn, _params) do
    data = send_message(%{type: :text, text: "Hello from here"}, "919917443994")
    handle(data, conn)
  end
end
