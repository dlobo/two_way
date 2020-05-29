defmodule TwoWay.Organizations.Organization do
  use Ecto.Schema
  import Ecto.Changeset

  schema "organizations" do
    field :bsp, :string
    field :bsp_key, :string
    field :contact_name, :string
    field :email, :string
    field :name, :string
    field :wa_number, :string

    timestamps()
  end

  @doc false
  def changeset(organization, attrs) do
    organization
    |> cast(attrs, [:name, :contact_name, :email, :bsp, :bsp_key, :wa_number])
    |> validate_required([:name, :contact_name, :email, :bsp, :bsp_key, :wa_number])
  end
end
