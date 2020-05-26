defmodule TwoWay.Messages.MessageMedia do
  use Ecto.Schema
  import Ecto.Changeset

  schema "message_media" do
    field :caption, :string
    field :original_url, :string
    field :thumbnail, :string
    field :url, :string
    field :wa_media_id, :string

    timestamps()
  end

  @doc false
  def changeset(message_media, attrs) do
    message_media
    |> cast(attrs, [:url, :original_url, :thumbnail, :caption, :wa_media_id])
    |> validate_required([:url, :original_url, :thumbnail, :caption, :wa_media_id])
  end
end
