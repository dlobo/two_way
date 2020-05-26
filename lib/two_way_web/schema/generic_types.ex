defmodule TwoWayWeb.Schema.GenericTypes do
  use Absinthe.Schema.Notation

  require TwoWay.Enums

  # define all enums specifically for absinthere
  @desc "The Contact Status enum"
  enum(:contact_status_enum, values: TwoWay.Enums.contact_status_const())

  @desc "The Message Types enum"
  enum(:message_types_enum , values: TwoWay.Enums.message_types_const())

  @desc "The Message Flow enum"
  enum(:message_flow_enum , values: TwoWay.Enums.message_flow_const())

  @desc "API Function Status enum"
  enum(:api_status_enum, values: TwoWay.Enums.api_status_const())

  @desc "Enum for ordering results"
  enum :sort_order do
    value :asc
    value :desc
  end

  @desc "An error encountered trying to persist input"
  object :input_error do
    field :key, non_null(:string)
    field :message, non_null(:string)
  end

  @desc """
  A generic status results for calls that dont return a value.
  Typically this is for delete operations
  """
  object :generic_result do
    field :status , non_null(:api_status_enum)
    field :errors, list_of(:input_error)
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

  scalar :decimal do
    parse fn
      %{value: value}, _ ->
        Decimal.parse(value)
      _, _ ->
        :error
    end

    serialize &to_string/1
  end


end
