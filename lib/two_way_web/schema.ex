defmodule TwoWayWeb.Schema do
  use Absinthe.Schema

  alias TwoWayWeb.Resolvers
  alias TwoWay.Attributes.Tag

  import_types __MODULE__.DataTypes

  query do

    @desc "Get a list of all tags filtered by various criteria"
    field :tags, list_of(:tag) do
      arg :filter, :tag_filter
      arg :order, type: :sort_order, default_value: :asc
      resolve &Resolvers.Attributes.tags/3
    end

    field :languages, list_of(:language) do
      resolve &Resolvers.Settings.languages/3
    end

  end

  def context(ctx) do
    loader =
      Dataloader.new
      |> Dataloader.add_source(Tag, Tag.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

end
