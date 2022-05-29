defmodule ChatMarket.Repo.Migrations.CreateBlocks do
  use Ecto.Migration

  def change do
    create table(:blocks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :start_at, :utc_datetime
      add :end_at, :utc_datetime

      timestamps()
    end
  end
end
