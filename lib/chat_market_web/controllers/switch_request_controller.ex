defmodule ChatMarketWeb.SwitchRequestController do
  use ChatMarketWeb, :controller

  alias ChatMarket.Block.BlocksUsers

  alias ChatMarket.Contexts.BlocksUsersManager

  def create(conn, %{"blocks_users_id" => blocks_users_id}) do
    with %BlocksUsers{} = block_user <- BlocksUsersManager.get(blocks_users_id) |> IO.inspect(label: "GET  BLOCK"),
    {:ok, %BlocksUsers{} = _updated_block_user} <- BlocksUsersManager.update(block_user, %{status: :available}) |> IO.inspect(label: "UPDATE BLOCK") do
      redirect(conn, to: Routes.block_path(conn, :index))
    end
  end
end
