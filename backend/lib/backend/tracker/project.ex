defmodule Backend.Tracker.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :name, :string
    field :public, :boolean, default: false
    field :archived, :boolean, default: false
    belongs_to :client, Backend.Tracker.Client

    timestamps()
  end

  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :public, :archived, :client_id])
    |> validate_required([:name, :client_id])
    |> assoc_constraint(:client)
  end
end
