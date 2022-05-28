defmodule ChatMarketWeb.Plugs.HealthCheckTest do
  use ChatMarketWeb.ConnCase, async: true
  use Plug.Test

  alias ChatMarketWeb.Plugs.HealthCheck

  describe "call/2" do
    test "when server is up" do
      conn_response =
        :get
        |> conn("/health")
        |> HealthCheck.call([])

      assert conn_response.state == :sent
      assert conn_response.status == 200
    end
  end
end
