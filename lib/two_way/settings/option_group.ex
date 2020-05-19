defmodule TwoWay.Settings.OptionGroup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "option_groups" do
    field :data_type, :string
    field :description, :string
    field :is_active, :boolean, default: false
    field :is_locked, :boolean, default: false
    field :is_reserved, :boolean, default: false
    field :label, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(option_group, attrs) do
    option_group
    |> cast(attrs, [:name, :label, :description, :data_type, :is_reserved, :is_active, :is_locked])
    |> validate_required([:name, :label, :description, :data_type, :is_reserved, :is_active, :is_locked])
  end
end
