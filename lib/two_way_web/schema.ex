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

  import_types __MODULE__.EnumTypes
  import_types __MODULE__.GenericTypes
  import_types __MODULE__.TagTypes
  import_types __MODULE__.LanguageTypes

  query do

    import_fields :tag_queries

    field :languages, list_of(:language) do
      resolve &Resolvers.Settings.languages/3
    end

  end

  mutation do
    import_fields :tag_mutations

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
