defmodule TwoWay.Contacts.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field :name, :string
    field :optin_time, :utc_datetime, default: nil
    field :optout_time, :utc_datetime, default: nil
    field :phone, :string
    field :status, :string, default: "active"
    field :wa_id, :string, default: nil
    field :wa_status, :string, default: "opted_in"
    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:name, :phone, :wa_status, :wa_id, :status, :optin_time, :optout_time])
    |> validate_required([:name, :phone])
    |> unique_constraint([:phone, :wa_id])
  end
end
