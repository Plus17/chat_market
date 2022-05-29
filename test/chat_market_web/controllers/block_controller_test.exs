defmodule ChatMarketWeb.BlockControllerTest do
  use ChatMarketWeb.ConnCase, async: true

  setup :register_and_log_in_user

  describe "index" do
    test "lists all blocks", %{conn: conn, user: user} do
      insert(:block_user, user: user)
      conn = get(conn, Routes.block_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Blocks"
    end
  end
end
