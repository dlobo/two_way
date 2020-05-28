defmodule TwoWay.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias TwoWay.{MessageStatusEnum, MessageTypesEnum}
  alias TwoWay.{Contacts.Contact, Messages.MessageMedia}
  schema "messages" do
    field :body         , :string
    field :flow         , :string
    field :type         , MessageTypesEnum
    field :wa_message_id, :string
    field :wa_status    , MessageStatusEnum

    belongs_to :sender   , Contact
    belongs_to :recipient, Contact
    belongs_to :media    , MessageMedia

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:type, :flow, :body, :wa_message_id, :wa_status, :sender_id, :recipient_id, :media_id])
    |> validate_required([
      :type,
      :flow,
      :wa_status,
      :sender_id,
      :recipient_id
    ])
  end

  def data() do
    Dataloader.Ecto.new(TwoWay.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end

end
