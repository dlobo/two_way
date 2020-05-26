defmodule TwoWay.Communicatios.BSP.Gupshup.ApiClient do
  use Tesla
  plug Tesla.Middleware.BaseUrl, "https://api.gupshup.io/sm/api/v1"

  plug Tesla.Middleware.Headers, [
    {"apikey", System.get_env("GUPSHUP_API_KEY") }
  ]

  plug Tesla.Middleware.FormUrlencoded,
    encode: &Plug.Conn.Query.encode/1
end
