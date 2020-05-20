defmodule TwoWayWeb.GupshupController do
  use TwoWayWeb, :controller

  def handler(conn, params, msg) do
    IO.puts(msg)
    IO.inspect(params)
    json conn, nil
  end

  def unknown(conn, params),
    do: handler(conn, params, "unknown handler")

end
