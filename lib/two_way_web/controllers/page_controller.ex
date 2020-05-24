defmodule TwoWayWeb.PageController do
  use TwoWayWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def hook(conn, params) do
    IO.inspect(params)
    json(conn, nil)
  end
end
