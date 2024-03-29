defmodule Ip.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    topologies = Application.get_env(:libcluster, :topologies) || []

    children = [
      # Start the Telemetry supervisor
      IpWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ip.PubSub},
      # Start the Endpoint (http/https)
      IpWeb.Endpoint,
      # Start a worker by calling: Ip.Worker.start_link(arg)
      # {Ip.Worker, arg}
      {Cluster.Supervisor, [topologies, [name: Ip.ClusterSupervisor]]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ip.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    IpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
