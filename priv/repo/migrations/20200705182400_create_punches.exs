defmodule Smena.Repo.Migrations.CreatePunches do
  use Ecto.Migration

  def change do
    create table(:punches) do
      add :in, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:punches, [:user_id])
  end
end
