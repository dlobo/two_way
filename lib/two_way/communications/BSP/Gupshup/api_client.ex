defmodule TwoWay.Communicatios.BSP.Gupshup.ApiClient do
  use Tesla
  plug Tesla.Middleware.BaseUrl, "https://api.gupshup.io/sm/api/v1"

  plug Tesla.Middleware.Headers, [
    {"apikey", System.get_env("GUPSHUP_API_KEY") || "380a3225dc604909c9cb8406c7d49f75"}
  ]

  plug Tesla.Middleware.FormUrlencoded,
    encode: &Plug.Conn.Query.encode/1
end
