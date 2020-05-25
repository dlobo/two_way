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
    with {:ok, tag} <- Attributes.create_tag(params) do
      {:ok, %{tag: tag}}
    end
  end

end
