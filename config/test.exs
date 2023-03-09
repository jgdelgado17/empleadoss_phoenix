import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :empleadoss_phoenix, EmpleadossPhoenix.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "empleadoss_phoenix_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :empleadoss_phoenix, EmpleadossPhoenixWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "pRBnDy7wxbtBkhFpIvmbfDP1YfjvfljgVAGH4UNEx8VVsxk/rIap7Q4m7FcVUyEj",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
