defmodule ChatMarketWeb.AvailableBlockController do
  use ChatMarketWeb, :controller

  alias ChatMarket.Blocks

  def index(conn, _params) do
    blocks_users = Blocks.list_block_by_available()

    render(conn, "index.html", blocks_users: blocks_users)
  end
end
