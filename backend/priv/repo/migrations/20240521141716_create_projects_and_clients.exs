defmodule Backend.Repo.Migrations.CreateProjectsAndClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string, null: false
      add :archived, :boolean, default: false, null: false

      timestamps()
    end

    create table(:projects) do
      add :client_id, references(:clients, on_delete: :nothing), null: false
      add :name, :string, null: false
      add :public, :boolean, default: false, null: false
      add :archived, :boolean, default: false, null: false

      timestamps()
    end

    create index(:projects, [:client_id])
  end
end
