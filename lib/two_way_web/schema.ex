defmodule TwoWayWeb.Schema do
  use Absinthe.Schema

  alias TwoWayWeb.Resolvers
  alias TwoWay.Attributes.Tag
  alias TwoWayWeb.Schema.Middleware

  def middleware(middleware, _field, %{identifier: :mutation}) do
    middleware ++ [Middleware.ChangesetErrors]
  end
  def middleware(middleware, _field, _object) do
    middleware
  end

  import_types __MODULE__.GenericTypes
  import_types __MODULE__.TagTypes
  import_types __MODULE__.LanguageTypes

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

  mutation do
    field :create_tag, :tag_result do
      arg :input, non_null(:tag_input)
      resolve &Resolvers.Attributes.create_tag/3
    end

    field :update_tag, :tag_result do
      arg :id   , non_null(:id)
      arg :input, :tag_input
      resolve &Resolvers.Attributes.update_tag/3
    end

    field :delete_tag, :tag_result do
      arg :id   , non_null(:id)
      resolve &Resolvers.Attributes.delete_tag/3
    end

    field :create_language, :language_result do
      arg :input, non_null(:language_input)
      resolve &Resolvers.Settings.create_language/3
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
