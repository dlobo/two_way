defmodule TwoWay.Attributes.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :description, :string
    field :is_active, :boolean, default: false
    field :is_reserved, :boolean, default: false
    field :label, :string
    field :language_id, :integer

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:label, :description, :is_reserved, :is_active, :language_id])
    |> validate_required([:label, :description, :is_reserved, :is_active, :language_id])
  end
end
