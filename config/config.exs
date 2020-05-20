# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :two_way,
  ecto_repos: [TwoWay.Repo]

# Configures the endpoint
config :two_way, TwoWayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m5NAUz+7SssCglFHfCYDCBAqe/iwFTxVjiPpJeIknyFw5br6HfYcPub9IzDIpYis",
  render_errors: [view: TwoWayWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TwoWay.PubSub,
  live_view: [signing_salt: "r3mbo+aV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configure to use UTC timestamp in tables
config :two_way,
       TwoWay.Repo,
       migration_timestamps: [type: :utc_datetime]

config :two_way, :pow,
  user: TwoWay.Users.User,
  repo: TwoWay.Repo,
  web_module: TwoWayWeb,
  extensions: [PowResetPassword, PowEmailConfirmation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: TwoWayWeb.Pow.Mailer,
  web_mailer_module: TwoWayWeb

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
