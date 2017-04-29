# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :nes_search,
  ecto_repos: [NesSearch.Repo]

# Configures the endpoint
config :nes_search, NesSearch.Web.Endpoint,
  http: [port: 4000],
  url: [host: "localhost"],
  secret_key_base: "NzvaC3WGTtyPgvICfkWFW4EWkDB50gwy8fi0ZKiLDAamW6NPZg8r8NSD2Xig4u/r",
  render_errors: [view: NesSearch.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: NesSearch.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :tirexs, :uri, "http://elasticsearch:9200"