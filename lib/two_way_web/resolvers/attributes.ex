defmodule TwoWayWeb.Resolvers.Attributes do
  alias TwoWay.{Attributes, Repo}

  def tags(_, args, _) do
    {:ok, Attributes.list_tags(args)}
  end

  def search(_, %{matching: term}, _) do
    {:ok, Attributes.search(term)}
  end

  def tags_for_language(language, _, _) do
    query = Ecto.assoc(language, :tags)
    {:ok, Repo.all(query)}
  end

  def create_tag(_, %{input: params}, _) do
    case Attributes.create_tag(params) do
      {:error, _} ->
        {:error, "Could not create tag"}
      {:ok, _} = success ->
        success
    end
  end

end
