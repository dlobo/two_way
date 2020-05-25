defmodule TwoWayWeb.Schema.DataTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias TwoWayWeb.Resolvers
  alias TwoWay.{Attributes.Tag, Settings.Language}

  object :language do
    interfaces [:search_result]
    field :id    , :id
    field :label , :string
    field :locale, :string

    field :tags, list_of(:tag) do
      resolve &Resolvers.Attributes.tags_for_language/3
    end
  end

  interface :search_result do
    field :label, :string
    resolve_type fn
      %Tag{}, _ ->
        :tag
      %Language{}, _ ->
        :language
      _, _ ->
        nil
    end
  end

  @desc "Filtering options for tags"
  input_object :tag_filter do
    @desc "Match the label"
    field :label, :string

    @desc "Match a language"
    field :language, :string
  end

  object :tag do
    interfaces [:search_result]

    field :id         , :id
    field :label      , :string
    field :description, :string
    field :is_active  , :boolean
    field :is_reserved, :boolean

    field :language   , :language do
      resolve dataloader(Tag)
    end

  end

  enum :sort_order do
    value :asc
    value :desc
  end


  scalar :date do
    parse fn input ->
      with %Absinthe.Blueprint.Input.String{value: value} <- input,
           {:ok, date} <- Date.from_iso8601(value) do
        {:ok, date}
      else
        _ -> :error
      end
    end

    serialize fn date ->
      Date.to_iso8601(date)
    end
  end

end
