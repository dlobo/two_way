defmodule TwoWay.Contacts.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field :name, :string
    field :optin_time, :utc_datetime
    field :optout_time, :utc_datetime
    field :phone, :string
    field :status, :string
    field :wa_id, :string
    field :wa_status, :string

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:name, :phone, :wa_status, :wa_id, :status, :optin_time, :optout_time])
    |> validate_required([:name, :phone, :wa_status, :wa_id, :status, :optin_time, :optout_time])
  end
end
