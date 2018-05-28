# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :multiple_phx_instances, MultiplePhxInstancesWeb.Endpoint,
  load_from_system_env: true,
  url: [host: "localhost"],
  secret_key_base: "Mgfs64VoBUWZaSz1PNRfnCUrBm2ep9Fxz7gweXQrD/W3zaBE9FFLgh+hq6Hs2QIL",
  render_errors: [view: MultiplePhxInstancesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MultiplePhxInstances.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :kernel,
  sync_nodes_optional: [:"n1@127.0.0.1", :"n2@127.0.0.1"],
  sync_nodes_timeout: 100_000


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
