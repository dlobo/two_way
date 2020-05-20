defmodule TwoWay.Attributes.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :label, :string
    field :description, :string

    field :is_active, :boolean, default: false
    field :is_reserved, :boolean, default: false

    belongs_to :option_value, TwoWay.Settings.OptionValue, foreign_key: :language_id

    belongs_to :tag, TwoWay.Attributes.Tag, foreign_key: :parent_id

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:label, :description, :is_reserved, :is_active, :language_id])
    |> validate_required([:label, :description, :is_reserved, :is_active, :language_id])
  end
end
