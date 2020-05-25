defmodule TwoWay.Attributes.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  alias TwoWay.{Settings.Language, Attributes.Tag}
  schema "tags" do
    field :label, :string
    field :description, :string

    field :is_active, :boolean, default: false
    field :is_reserved, :boolean, default: false

    belongs_to :language, Language

    belongs_to :tags, Tag, foreign_key: :parent_id

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:label, :description, :is_reserved, :is_active, :language_id])
    |> validate_required([:label, :language_id])
    |> foreign_key_constraint(:language)
    |> unique_constraint([:label, :language_id])
  end

  def data() do
    Dataloader.Ecto.new(TwoWay.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end

end
