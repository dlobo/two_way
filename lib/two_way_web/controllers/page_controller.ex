defmodule TwoWayWeb.PageController do
  use TwoWayWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
