defmodule ChatMarketWeb.PageControllerTest do
  use ChatMarketWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "¡Te damos la bienvenida al Chat Market!"
  end
end
