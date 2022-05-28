defmodule ChatMarket.Blocks.Block do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "blocks" do
    field :end_at, :utc_datetime
    field :start_at, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(block, attrs) do
    block
    |> cast(attrs, [:start_at, :end_at])
    |> validate_required([:start_at, :end_at])
  end
end
