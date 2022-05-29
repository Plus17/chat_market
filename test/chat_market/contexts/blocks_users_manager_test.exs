defmodule ChatMarket.Contexts.BlocksUsersManagerTest do
  use ChatMarket.DataCase, async: true

  alias ChatMarket.Contexts.BlocksUsersManager

  test "create/1 with rigth" do
    user = insert(:user)
    block = insert(:block)

    params = %{
      user_id: user.id,
      block_id: block.id
    }

    assert {:ok, _blocks_users} = BlocksUsersManager.create(params)
  end
end
