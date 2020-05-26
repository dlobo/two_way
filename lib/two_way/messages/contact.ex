defmodule TwoWay.Messages.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field :name, :string
    field :phone_number, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:name, :phone_number, :status])
    |> validate_required([:name, :phone_number, :status])
  end
end
