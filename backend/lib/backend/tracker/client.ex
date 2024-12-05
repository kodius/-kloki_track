defmodule Backend.Tracker.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field :name, :string
    field :archived, :boolean, default: false
    has_many :projects, Backend.Tracker.Project

    timestamps()
  end

  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :archived])
    |> validate_required([:name])
  end
end
