defmodule TwoWay.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :body, :string
    field :flow, :string
    field :type, :string
    field :wa_message_id, :string
    field :sender_id, :id
    field :receipient_id, :id
    field :media_id, :id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:type, :flow, :body, :wa_message_id])
    |> validate_required([:type, :flow, :body, :wa_message_id])
  end
end
