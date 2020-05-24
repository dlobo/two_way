defmodule TwoWayWeb.Schema.DataTypes do
  use Absinthe.Schema.Notation

  object :tag do
    field :id         , :id
    field :label      , :string
    field :description, :string
    field :is_active  , :boolean
    field :is_reserved, :boolean
  end
end
