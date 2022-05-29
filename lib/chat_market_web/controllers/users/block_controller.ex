defmodule ChatMarketWeb.BlockController do
  use ChatMarketWeb, :controller

  alias ChatMarket.Blocks

  def index(conn, _params) do
    blocks =
      Blocks.list_block_by_user_id(conn.assigns.current_user.id)

    render(conn, "index.html", blocks: blocks)
  end
end
