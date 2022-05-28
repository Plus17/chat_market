defmodule ChatMarket.BlocksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ChatMarket.Blocks` context.
  """

  @doc """
  Generate a block.
  """
  def block_fixture(attrs \\ %{}) do
    {:ok, block} =
      attrs
      |> Enum.into(%{
        end_at: ~U[2022-05-27 23:43:00Z],
        start_at: ~U[2022-05-27 23:43:00Z]
      })
      |> ChatMarket.Blocks.create_block()

    block
  end
end
