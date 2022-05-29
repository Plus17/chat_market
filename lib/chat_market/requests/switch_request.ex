defmodule ChatMarket.Requests.SwitchRequest do
  use Ecto.Schema
  import Ecto.Changeset

  alias ChatMarket.Contexts.Users.User

  alias ChatMarket.Block.BlocksUsers

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "switch_requests" do
    field :status, Ecto.Enum, values: [:requested, :accepted, :rejected]

    belongs_to :requester, User
    belongs_to :requested, User
    belongs_to :blocks_users_requester, BlocksUsers
    belongs_to :blocks_users_requested, BlocksUsers

    timestamps()
  end

  @required_fields [
    :status,
    :blocks_users_requester_id,
    :blocks_users_requested_id,
    :requester_id,
    :requested_id
  ]

  @doc false
  def changeset(switch_request, attrs) do
    switch_request
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
