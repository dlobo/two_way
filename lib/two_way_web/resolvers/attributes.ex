defmodule TwoWayWeb.Resolvers.Attributes do
  alias TwoWay.Attributes

  def tags(_, args, _) do
    {:ok, Attributes.list_tags(args)}
  end

  def search(_, %{matching: term}, _) do
    {:ok, Attributes.search(term)}
  end

  def tags_for_language(language, _, _) do
    query = Ecto.assoc(language, :tags)
    {:ok, TwoWayWeb.Repo.all(query)}
  end

end
