defmodule ChatMarket.BlockFactory do
  @moduledoc """
  Block factory to populate test data
  """

  alias ChatMarket.Blocks.Block

  defmacro __using__(_opts) do
    quote do
      def block_factory do
        %Block{
          end_at: ~U[2022-05-27 23:43:00Z],
          start_at: ~U[2022-05-27 23:43:00Z]
        }
      end
    end
  end
end
