defmodule TwoWay.Settings.Language do
  use Ecto.Schema
  import Ecto.Changeset

  schema "languages" do
    field :description, :string
    field :is_active, :boolean, default: false
    field :label, :string
    field :locale, :string

    has_many :tags, TwoWay.Attributes.Tag

    timestamps()
  end

  @doc false
  def changeset(language, attrs) do
    language
    |> cast(attrs, [:label, :description, :locale, :is_active])
    |> validate_required([:label, :description, :locale, :is_active])
  end
end
