defmodule TwoWay.Repo.Migrations.CreateEnums do
  use Ecto.Migration

  alias TwoWay.{APIStatusEnum, ContactStatusEnum, MessageFlowEnum, MessageTypesEnum, SortOrderEnum}

  def up do
    APIStatusEnum.create_type()
    ContactStatusEnum.create_type()
    MessageFlowEnum.create_type()
    MessageTypesEnum.create_type()
    SortOrderEnum.create_type()
  end

  def down do
    APIStatusEnum.drop_type()
    ContactStatusEnum.drop_type()
    MessageFlowEnum.drop_type()
    MessageTypesEnum.drop_type()
    SortOrderEnum.drop_type()
  end

end
