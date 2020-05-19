defmodule TwoWay.Settings.OptionValue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "option_values" do
    field :description, :string
    field :filter, :integer
    field :grouping, :string
    field :is_active, :boolean, default: false
    field :is_default, :boolean, default: false
    field :is_optgroup, :boolean, default: false
    field :is_reserved, :boolean, default: false
    field :label, :string
    field :value, :string
    field :weight, :integer

    timestamps()
  end

  @doc false
  def changeset(option_value, attrs) do
    option_value
    |> cast(attrs, [:label, :description, :value, :grouping, :filter, :weight, :is_default, :is_optgroup, :is_reserved, :is_active])
    |> validate_required([:label, :description, :value, :grouping, :filter, :weight, :is_default, :is_optgroup, :is_reserved, :is_active])
  end
end
