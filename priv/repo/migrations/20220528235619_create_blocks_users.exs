defmodule ChatMarket.Repo.Migrations.CreateBlocksUsers do
  use Ecto.Migration

  def change do
    create table(:blocks_users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :block_id, references(:blocks, on_delete: :nothing, type: :binary_id)
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :status, :string, default: "assigned"

      timestamps()
    end

    create index(:blocks_users, [:block_id])
    create index(:blocks_users, [:user_id])
  end
end
