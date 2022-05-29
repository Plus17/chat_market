defmodule ChatMarketWeb.RequestedBlocksController do
  use ChatMarketWeb, :controller


  def index(conn, _params) do
    requested_blocks = []

    render(conn, "index.html", requested_blocks: requested_blocks)
  end
end
