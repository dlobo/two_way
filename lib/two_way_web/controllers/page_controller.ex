defmodule TwoWayWeb.PageController do
  use TwoWayWeb, :controller

  # use TwoWay.Communication.Message

  alias TwoWay.Messages
  alias TwoWay.Messages.Message

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
    # message =  %{body: "Hello world"}
    # contact =  "+919917443994"
    # data =  TwoWay.Communication.Message.send_text(message, contact

    message = %{
      body: "Hello 5",
      flow: "inbound",
      recipient_id: 1,
      sender_id: 1,
      type: :text,
      wa_message_id: "ABEGkZkXRDmUAgo-sPQQyhtCyaLl",
      wa_status: "received"
    }

    data = TwoWay.Messages.create_message(message)

    handle(data, conn)
  end
end
