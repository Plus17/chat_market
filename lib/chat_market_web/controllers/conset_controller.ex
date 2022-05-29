defmodule ChatMarketWeb.ConsentController do
  use ChatMarketWeb, :controller

  def consent(conn, params) do
    IO.inspect(params)

    conn
    |> put_status(200)
    |> render("consent.json")
  end
end
