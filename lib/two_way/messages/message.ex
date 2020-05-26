defmodule TwoWay.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :body, :string
    field :flow, :string
    field :type, :string
    field :wa_message_id, :string
    field :wa_status, :string
    belongs_to :sender_id, TwoWay.Contacts.Contact
    belongs_to :receipient_id, TwoWay.Contacts.Contact
    belongs_to :media_id, TwoWay.Messages.MessageMedia

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:type, :flow, :body, :wa_message_id, :wa_status, :sender_id, :receipient_id])
    |> validate_required([:type, :flow, :body, :wa_message_id, :wa_status, :sender_id, :receipient_id])
  end
end
