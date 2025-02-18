defmodule ShelixirApi.Repo do
  use Ecto.Repo,
    otp_app: :shelixir_api,
    adapter: Ecto.Adapters.Postgres
end
