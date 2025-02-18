defmodule ShelixirApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ShelixirApiWeb.Telemetry,
      ShelixirApi.Repo,
      {DNSCluster, query: Application.get_env(:shelixir_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ShelixirApi.PubSub},
      # Start a worker by calling: ShelixirApi.Worker.start_link(arg)
      # {ShelixirApi.Worker, arg},
      # Start to serve requests, typically the last entry
      ShelixirApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShelixirApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ShelixirApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
