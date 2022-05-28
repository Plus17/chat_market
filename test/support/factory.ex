defmodule ChatMarket.Factory do
  @moduledoc """
  Factory module configuration for global factories
  """

  use ExMachina.Ecto, repo: ChatMarket.Repo

  def valid_user_password, do: "hello world!"
  def unique_user_email, do: "user#{System.unique_integer()}@example.com"

  use ChatMarket.UserFactory
  use ChatMarket.BlockFactory
end
