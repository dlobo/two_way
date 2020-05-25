defmodule TwoWayWeb.Schema.TagTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias TwoWayWeb.Resolvers
  alias TwoWay.{Attributes.Tag, Settings.Language}

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

  object :tag_result do
    field :tag   , :tag
    field :errors, list_of(:input_error)
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

  @desc "Filtering options for tags"
  input_object :tag_filter do
    @desc "Match the label"
    field :label, :string

    @desc "Match the description"
    field :description, :string

    @desc "Match a language"
    field :language, :string

    @desc "Match the active flag"
    field :is_active, :boolean

    @desc "Match the reserved flag"
    field :is_reserved, :boolean
  end

  input_object :tag_input do
    field :label      , non_null(:string)
    field :description, :string
    field :is_active  , :boolean
    field :is_reserved, :boolean
    field :language_id, non_null(:id)
  end

end
