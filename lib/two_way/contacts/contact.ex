defmodule TwoWay.Contacts.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  alias TwoWay.ContactStatusEnum

  schema "contacts" do
    field :name, :string
    field :phone, :string
    field :wa_id, :string, default: nil

    field :status, ContactStatusEnum
    field :wa_status, ContactStatusEnum

    field :optin_time, :utc_datetime
    field :optout_time, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:name, :phone, :wa_status, :wa_id, :status, :optin_time, :optout_time])
    |> validate_required([:name, :phone])
    |> unique_constraint([:phone, :wa_id])
  end

  def data() do
    Dataloader.Ecto.new(TwoWay.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end

end
