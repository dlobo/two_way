defmodule TwoWayWeb.GupshupController do
  use TwoWayWeb, :controller

  def user_event(conn, params) do
    IO.puts("User event handler")
    IO.inspect(params)
    json conn, nil
  end

  def message_event(conn, params) do
    IO.inspect("Message event handler")
    IO.inspect(params)
    json conn, nil
  end

  def message(conn, params) do
    IO.puts("message handler")
    IO.inspect(params)
    json conn, nil
  end

  def unknown(conn, params) do
    IO.puts("unknown handler")
    IO.inspect(params)
    json conn, nil
  end

end
