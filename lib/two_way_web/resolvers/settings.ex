defmodule TwoWayWeb.Resolvers.Settings do

  alias TwoWay.Settings
  alias TwoWay.Attributes

  def languages(_, args, _) do
    {:ok, Settings.list_languages(args)}
  end

  def search(_, %{matching: term}, _) do
    {:ok, Attributes.search(term)}
  end

end
