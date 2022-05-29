defmodule ChatMarketWeb.AvailableBlockController do
  use ChatMarketWeb, :controller

  alias ChatMarket.Blocks

  def index(conn, params) do
    blocks_users = Blocks.list_block_by_available(conn.assigns.current_user.id)
    current_user_available_blocks = Blocks.list_my_available_blocks(conn.assigns.current_user.id)

    render(conn, "index.html", blocks_users: blocks_users, current_user_available_blocks: current_user_available_blocks, block_user_requester_id: params["block_user_requester_id"])
  end

  def create(conn, params) do
    redirect(conn, to: Routes.available_block_path(conn, :index, block_user_requester_id: params["block_user_requester_id"]))
  end
end
