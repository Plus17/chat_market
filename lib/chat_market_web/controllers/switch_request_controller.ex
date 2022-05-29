defmodule ChatMarketWeb.SwitchRequestController do
  use ChatMarketWeb, :controller

  alias ChatMarket.Block.BlocksUsers

  alias ChatMarket.Contexts.BlocksUsersManager

  def create(conn, %{"blocks_users_id" => blocks_users_id}) do
    with %BlocksUsers{} = block_user <- BlocksUsersManager.get(blocks_users_id),
    {:ok, %BlocksUsers{} = _updated_block_user} <- BlocksUsersManager.update(block_user, %{status: :available}) do
      redirect(conn, to: Routes.available_block_path(conn, :index))
    end
  end
end
