defmodule Smena.Punches.Punch do
  use Ecto.Schema
  import Ecto.Changeset

  schema "punches" do
    field :in, :boolean, default: false
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(punch, attrs) do
    punch
    |> cast(attrs, [:in])
    |> validate_required([:in])
  end
end
