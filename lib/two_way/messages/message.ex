defmodule TwoWay.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias TwoWay.MessageTypesEnum

  schema "messages" do
    field :body, :string
    field :flow, :string
    field :type, MessageTypesEnum
    field :wa_message_id, :string
    field :wa_status, :string
    belongs_to :sender, TwoWay.Contacts.Contact
    belongs_to :recipient, TwoWay.Contacts.Contact
    belongs_to :media, TwoWay.Messages.MessageMedia

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:type, :flow, :body, :wa_message_id, :wa_status, :sender_id, :recipient_id])
    |> validate_required([
      :type,
      :flow,
      :body,
      :wa_message_id,
      :wa_status,
      :sender_id,
      :recipient_id
    ])
  end
end
