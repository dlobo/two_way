defmodule TwoWay.Repo do
  use Ecto.Repo,
    otp_app: :two_way,
    adapter: Ecto.Adapters.Postgres

  def fetch(queryable, id, opts \\ []) do
    case get(queryable, id, opts) do
      nil      -> {:error, :resource_not_found}
      resource -> {:ok   , resource}
    end
  end

  def fetch_by(queryable, clauses, opts \\ []) do
    case get_by(queryable, clauses, opts) do
      nil      -> {:error, :resource_not_found}
      resource -> {:ok   , resource}
    end
  end

end
