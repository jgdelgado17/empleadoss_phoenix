defmodule EmpleadossPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :empleadoss_phoenix,
    adapter: Ecto.Adapters.Postgres
end
