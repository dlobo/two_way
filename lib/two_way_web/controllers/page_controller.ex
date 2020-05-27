defmodule TwoWayWeb.PageController do
  use TwoWayWeb, :controller

  use TwoWay.Communication.Message

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
    message =  %{body: "Hello world"}
    contact =  "+919917443994"
    data =  TwoWay.Communication.Message.send_text(message, contact)
    handle(data, conn)
  end
end
