defmodule TwoWay.Repo do
  use Ecto.Repo,
    otp_app: :two_way,
    adapter: Ecto.Adapters.Postgres
end
