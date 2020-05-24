defmodule TwoWayWeb.Schema do
  use Absinthe.Schema

  import_types __MODULE__.DataTypes

  query do
    @desc "Get a list of all tags filtered by various criteria"
    field :tags, list_of(:tag) do
      resolve fn _parent, _args, _resolution ->
        {:ok, TwoWay.Attributes.list_tags()}
    end
    end
  end
end
