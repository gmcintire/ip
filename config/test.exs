import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ip, IpWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "NgsLCvdiwPUFmy37e1geNAqOPJm7V4iEjPvaurQyZfSbRXUlB+nNRqK1zlrFtEo0",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
