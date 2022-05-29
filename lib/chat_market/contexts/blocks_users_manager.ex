defmodule ChatMarket.Contexts.BlocksUsersManager do
  @moduledoc """
  Operations with user blocks
  """
  import Ecto.Query, warn: false
  alias ChatMarket.Repo

  alias ChatMarket.Block.BlocksUsers

  @doc """
  Creates a relationship beetwen blocks and users
  """
  @spec create(map()) :: {:ok, BlocksUsers.t()}
  def create(attrs) do
    %BlocksUsers{}
    |> BlocksUsers.changeset(attrs)
    |> Repo.insert()
  end
end
