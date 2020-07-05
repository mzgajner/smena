# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :app,
  namespace: Smena,
  ecto_repos: [Smena.Repo]

# Configures the endpoint
config :app, SmenaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RlydMWrbo978Jbn8EFjf0EfTPbShaVlC6D1/2qoZocFR7n1J/RlMXVPNN8sLRRxi",
  render_errors: [view: SmenaWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Smena.PubSub,
  live_view: [signing_salt: "tMhpTFR3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
