defmodule ChatMarket.BlocksUsersFactory do
  @moduledoc """
  BlocksUsers factory to populate test data
  """

  alias ChatMarket.Block.BlocksUsers

  defmacro __using__(_opts) do
    quote do
      def block_user_factory do
        %BlocksUsers{
          block: build(:block),
          user: build(:user),
          status: :assigned
        }
      end
    end
  end
end
