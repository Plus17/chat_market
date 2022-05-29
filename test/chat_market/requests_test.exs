defmodule ChatMarket.RequestsTest do
  use ChatMarket.DataCase

  alias ChatMarket.Requests

  describe "switch_requests" do
    alias ChatMarket.Requests.SwitchRequest

    @invalid_attrs %{status: nil}

    test "list_switch_requests/0 returns all switch_requests" do
      insert(:switch_request)
      assert [_switch_request] = Requests.list_switch_requests()
    end

    test "get_switch_request!/1 returns the switch_request with given id" do
      switch_request = insert(:switch_request)
      assert Requests.get_switch_request!(switch_request.id).id == switch_request.id
    end

    test "create_switch_request/1 with valid data creates a switch_request" do
      requester = insert(:user)
      requested = insert(:user)
      block_user_requester  = insert(:block_user, user: requester)
      block_user_requested  = insert(:block_user, user: requested)

      params = %{
        status: :requested,
        requester_id: requester.id,
        requested_id: requested.id,
        blocks_users_requester_id: block_user_requester.id,
        blocks_users_requested_id: block_user_requested.id
      }

      assert {:ok, %SwitchRequest{} = switch_request} = Requests.create_switch_request(params)
      assert switch_request.status == :requested
    end

    test "create_switch_request/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Requests.create_switch_request(@invalid_attrs)
    end

    test "update_switch_request/2 with valid data updates the switch_request" do
      switch_request = insert(:switch_request)
      update_attrs = %{status: :rejected}

      assert {:ok, %SwitchRequest{} = switch_request} = Requests.update_switch_request(switch_request, update_attrs)
      assert switch_request.status == :rejected
    end

    test "update_switch_request/2 with invalid data returns error changeset" do
      switch_request = insert(:switch_request)
      assert {:error, %Ecto.Changeset{}} = Requests.update_switch_request(switch_request, @invalid_attrs)
      assert switch_request.id == Requests.get_switch_request!(switch_request.id).id
    end

    test "change_switch_request/1 returns a switch_request changeset" do
      switch_request = insert(:switch_request)
      assert %Ecto.Changeset{} = Requests.change_switch_request(switch_request)
    end
  end
end
