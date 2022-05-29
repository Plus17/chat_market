defmodule ChatMarket.Repo.Migrations.CreateSwitchRequests do
  use Ecto.Migration

  def change do
    create table(:switch_requests, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :status, :string

      add :blocks_users_requester_id,
          references(:blocks_users, on_delete: :nothing, type: :binary_id)

      add :blocks_users_requested_id,
          references(:blocks_users, on_delete: :nothing, type: :binary_id)

      add :requester_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :requested_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:switch_requests, [:blocks_users_requester_id])
    create index(:switch_requests, [:blocks_users_requested_id])
    create index(:switch_requests, [:requester_id])
    create index(:switch_requests, [:requested_id])
  end
end
