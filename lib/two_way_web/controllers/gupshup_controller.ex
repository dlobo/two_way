defmodule TwoWayWeb.GupshupController do
  use TwoWayWeb, :controller

  def handler(conn, params, msg) do
    IO.puts(msg)
    IO.inspect(params)
    json conn, nil
  end

  def user_event(conn, params),
    do: handler(conn, params, "User event handler")

  def sandbox_start(conn, params),
    do: handler(conn, params, "Sandbox start handler")

  def opted_in(conn, params),
    do: handler(conn, params, "Opted in handler")

  def opted_out(conn, params),
    do: handler(conn, params, "Opted out handler")

  def message_event(conn, params),
    do: handler(conn, params, "Message event handler")

  def enqueued(conn, params),
    do:  handler(conn, params, "enqueued handler")

  def failed(conn, params),
    do:  handler(conn, params, "failed handler")

  def sent(conn, params),
    do:  handler(conn, params, "sent handler")

  def delivered(conn, params),
    do:  handler(conn, params, "delivered handler")

  def message(conn, params),
    do: handler(conn, params, "message handler")

  def text(conn, params),
    do:  handler(conn, params, "text handler")

  def image(conn, params),
    do:  handler(conn, params, "image handler")

  def file(conn, params),
    do:  handler(conn, params, "file handler")

  def audio(conn, params),
    do:  handler(conn, params, "audio handler")

  def video(conn, params),
    do:  handler(conn, params, "video handler")

  def contact(conn, params),
    do:  handler(conn, params, "contact handler")

  def location(conn, params),
    do:  handler(conn, params, "location handler")

  def unknown(conn, params),
    do: handler(conn, params, "unknown handler")

end
