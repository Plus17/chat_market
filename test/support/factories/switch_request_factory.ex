defmodule ChatMarket.SwitchRequestFactory do
  @moduledoc """
  User factory to populate test data
  """

  alias ChatMarket.Requests.SwitchRequest

  defmacro __using__(_opts) do
    quote do
      def switch_request_factory do
        %SwitchRequest{
          status: :requested,
          blocks_users_requester: build(:block_user),
          blocks_users_requested: build(:block_user),
          requester: build(:user),
          requested: build(:user)
        }
      end
    end
  end
end
