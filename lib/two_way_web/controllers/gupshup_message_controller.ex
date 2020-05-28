defmodule TwoWayWeb.GupshupMessageController do
  use TwoWayWeb, :controller

  alias TwoWay.Commnunications.BSP.Gupshup.Message, as: GupshupMessage
  alias TwoWay.Communications.Message, as: Communications

  def handler(conn, params, msg) do
    IO.puts(msg)
    IO.inspect(params)
    json(conn, nil)
  end

  def message(conn, params),
    do: handler(conn, params, "message handler")

  def text(conn, params) do
    GupshupMessage.receive_text(params)
    |> Communications.receive_text()
    handler(conn, params, "text handler")
  end

  def image(conn, params) do
    GupshupMessage.receive_image(params)
    |> Communications.receive_image()

    handler(conn, params, "image handler")
  end

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
