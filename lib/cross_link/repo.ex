defmodule CrossLink.Repo do
  use Ecto.Repo,
    otp_app: :cross_link,
    adapter: Ecto.Adapters.Postgres
end
