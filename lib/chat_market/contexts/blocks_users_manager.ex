defmodule ChatMarket.Contexts.BlocksUsersManager do
  @moduledoc """
  Operations with user blocks
  """
  import Ecto.Query, warn: false
  alias ChatMarket.Repo

  alias ChatMarket.Block.BlocksUsers

  # alias ChatMarket.Requests.SwitchRequest

  @doc """
  Creates a relationship beetwen blocks and users
  """
  @spec create(map()) :: {:ok, BlocksUsers.t()}
  def create(attrs) do
    %BlocksUsers{}
    |> BlocksUsers.changeset(attrs)
    |> Repo.insert()
  end

  def get(blocks_users_id) do
    BlocksUsers
    |> preload([:user, :block])
    |> Repo.get!(blocks_users_id)
  end

  def update(%BlocksUsers{} = block_user, attrs) do
    block_user
    |> BlocksUsers.changeset(attrs)
    |> Repo.update()
  end
end
