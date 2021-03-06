defmodule ChatMarket.Blocks do
  @moduledoc """
  The Blocks context.
  """

  import Ecto.Query, warn: false
  alias ChatMarket.Repo

  alias ChatMarket.Blocks.Block
  alias ChatMarket.Block.BlocksUsers

  @doc """
  Returns the list of blocks.

  ## Examples

      iex> list_blocks()
      [%Block{}, ...]

  """
  def list_blocks do
    Repo.all(Block)
  end

  def list_block_by_user_id(user_id) do
    BlocksUsers
    |> where([b], b.user_id == ^user_id)
    |> preload([:user, :block])
    |> Repo.all()
  end

  def list_my_available_blocks(current_user_id) do
    BlocksUsers
    |> where([block], block.status == ^:available)
    |> where([block], block.user_id == ^current_user_id)
    |> preload([:user, :block])
    |> Repo.all()
  end

  def list_block_by_available(current_user_id) do
    BlocksUsers
    |> where([block], block.status == ^:available)
    |> where([block], block.user_id != ^current_user_id)
    |> preload([:user, :block])
    |> Repo.all()
  end

  @doc """
  Gets a single block.

  Raises `Ecto.NoResultsError` if the Block does not exist.

  ## Examples

      iex> get_block!(123)
      %Block{}

      iex> get_block!(456)
      ** (Ecto.NoResultsError)

  """
  def get_block!(id), do: Repo.get!(Block, id)

  @doc """
  Creates a block.

  ## Examples

      iex> create_block(%{field: value})
      {:ok, %Block{}}

      iex> create_block(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_block(attrs \\ %{}) do
    %Block{}
    |> Block.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a block.

  ## Examples

      iex> update_block(block, %{field: new_value})
      {:ok, %Block{}}

      iex> update_block(block, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_block(%Block{} = block, attrs) do
    block
    |> Block.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a block.

  ## Examples

      iex> delete_block(block)
      {:ok, %Block{}}

      iex> delete_block(block)
      {:error, %Ecto.Changeset{}}

  """
  def delete_block(%Block{} = block) do
    Repo.delete(block)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking block changes.

  ## Examples

      iex> change_block(block)
      %Ecto.Changeset{data: %Block{}}

  """
  def change_block(%Block{} = block, attrs \\ %{}) do
    Block.changeset(block, attrs)
  end
end
