defmodule ChatMarket.Repo do
  use Ecto.Repo,
    otp_app: :chat_market,
    adapter: Ecto.Adapters.Postgres
end
