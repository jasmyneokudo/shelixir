# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :shelixir_api,
  ecto_repos: [ShelixirApi.Repo],
  generators: [timestamp_type: :utc_datetime, binary_id: true]

# Configures the endpoint
config :shelixir_api, ShelixirApiWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: ShelixirApiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: ShelixirApi.PubSub,
  live_view: [signing_salt: "7Lznu7R9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :shelixir_api, ShelixirApiWeb.Auth.Guardian,
    issuer: "shelixir_api",
    secret_key: "m82HocTn3KuL4w33EV5/CkTTVNXQ/nIlmkp4XN++AixIvgfakK+CCL9LGTpcgjer"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
