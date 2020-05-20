defmodule TwoWay.Content.SessionMessage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "session_messages" do
    field :label, :string
    field :body, :string

    field :is_source, :boolean, default: false
    field :is_translated, :boolean, default: false
    field :is_active, :boolean, default: false
    field :is_reserved, :boolean, default: false

    belongs_to :option_value, TwoWay.Settings.OptionValue, foreign_key: :language_id

    belongs_to :tag, TwoWay.Attributes.Tag

    belongs_to :session_message, TwoWay.Content.SessionMessage, foreign_key: :parent_id

    timestamps()
  end

  @doc false
  def changeset(session_message, attrs) do
    session_message
    |> cast(attrs, [
      :label,
      :body,
      :is_reserved,
      :is_active,
      :is_source,
      :is_translated,
      :language_id
    ])
    |> validate_required([
      :label,
      :body,
      :is_reserved,
      :is_active,
      :is_source,
      :is_translated,
      :language_id
    ])
  end
end
