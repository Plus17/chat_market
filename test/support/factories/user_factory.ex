defmodule ChatMarket.UserFactory do
  @moduledoc """
  User factory to populate test data
  """

  alias ChatMarket.Contexts.Users.User

  defmacro __using__(_opts) do
    quote do
      def user_factory do
        %User{
          email: sequence(:email, &"user#{&1}@example.com"),
          hashed_password:
            "$argon2id$v=19$m=65536,t=8,p=2$CH+c9Kx5QTJhQvKxQgbe9A$/I7GNjrwptBIDz8Q3C1ds31z1Vy427rpmumQcK86aGA"
        }
      end
    end
  end
end
