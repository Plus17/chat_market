defmodule ChatMarketWeb.BlockController do
  use ChatMarketWeb, :controller

  alias ChatMarket.Blocks

  def index(conn, _params) do
    blocks = Blocks.list_blocks()
    render(conn, "index.html", blocks: blocks)
  end
end
