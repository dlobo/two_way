defmodule TwoWayWeb.GupshupMessageController do
  use TwoWayWeb, :controller

  def handler(conn, params, msg) do
    IO.puts(msg)
    IO.inspect(params)
    json(conn, nil)
  end

  def message(conn, params),
    do: handler(conn, params, "message handler")

  def text(conn, params) do
    # parse message and save
    {_message, _contact} = TwoWay.Communication.Message.receive_text(params)
    handler(conn, params, "text handler")
  end

  def image(conn, params),
    do: handler(conn, params, "image handler")

  def file(conn, params),
    do: handler(conn, params, "file handler")

  def audio(conn, params),
    do: handler(conn, params, "audio handler")

  def video(conn, params),
    do: handler(conn, params, "video handler")

  def contact(conn, params),
    do: handler(conn, params, "contact handler")

  def location(conn, params),
    do: handler(conn, params, "location handler")
end
