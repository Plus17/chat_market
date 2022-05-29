defmodule ChatMarketWeb.MarkBlockController do
  use ChatMarketWeb, :controller

  alias ChatMarket.Block.BlocksUsers

  alias ChatMarket.Contexts.BlocksUsersManager

  def create(conn, %{"blocks_users_id" => blocks_users_id}) do
    with %BlocksUsers{} = block_user <-
           BlocksUsersManager.get(blocks_users_id) |> IO.inspect(label: "GET  BLOCK"),
         {:ok, %BlocksUsers{} = updated_block_user} <-
           BlocksUsersManager.update(block_user, %{status: :available})
           |> IO.inspect(label: "UPDATE BLOCK") do
      redirect(conn,
        to: Routes.available_block_path(conn, :index, changed_block_user: updated_block_user)
      )
    end
  end
end
