defmodule TwoWayWeb.Schema.LanguageTypes do
  use Absinthe.Schema.Notation

  alias TwoWayWeb.Resolvers

  object :language do
    interfaces [:search_result]
    field :id         , :id
    field :label      , :string
    field :locale     , :string
    field :is_active  , :boolean

    field :tags, list_of(:tag) do
      resolve &Resolvers.Attributes.tags_for_language/3
    end
  end

  input_object :language_input do
    field :label      , non_null(:string)
    field :locale     , non_null(:string)
    field :is_active  , :boolean
    field :is_reserved, :boolean
  end

  object :language_result do
    field :language, :language
    field :errors  , list_of(:input_error)
  end

end
