defmodule TwoWay.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TwoWay.Repo,
      # Start the Telemetry supervisor
      TwoWayWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TwoWay.PubSub},
      # Start the Endpoint (http/https)
      TwoWayWeb.Endpoint,
      # Add Oban to process jobs
      {Oban, oban_config()},
      # Add Absinthe's subscription
      {Absinthe.Subscription, TwoWayWeb.Endpoint},
      # Start a worker by calling: TwoWay.Worker.start_link(arg)
      # {TwoWay.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TwoWay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TwoWayWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp oban_config do
    opts = Application.get_env(:two_way, Oban)

    # Prevent running queues or scheduling jobs from an iex console.
    if Code.ensure_loaded?(IEx) and IEx.started?() do
      opts
      |> Keyword.put(:crontab, false)
      |> Keyword.put(:queues, false)
    else
      opts
    end
  end
end
