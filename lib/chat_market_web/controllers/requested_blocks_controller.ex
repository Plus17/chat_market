defmodule ChatMarketWeb.RequestedBlocksController do
  use ChatMarketWeb, :controller

  alias ChatMarket.Requests

  def index(conn, _params) do
    requested_blocks = Requests.get_by_requested_id(conn.assigns.current_user.id)

    render(conn, "index.html", requested_blocks: requested_blocks)
  end
end
