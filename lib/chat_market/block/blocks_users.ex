defmodule ChatMarket.Block.BlocksUsers do
  use Ecto.Schema
  import Ecto.Changeset

  alias ChatMarket.Contexts.Users.User

  alias ChatMarket.Blocks.Block

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "blocks_users" do
    field :status, Ecto.Enum, values: [:assigned, :available]

    belongs_to :user, User
    belongs_to :block, Block

    timestamps()
  end

  @doc false
  def changeset(blocks_users, attrs) do
    blocks_users
    |> cast(attrs, [])
    |> validate_required([])
  end
end
