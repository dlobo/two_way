defmodule TwoWay.Repo.Migrations.CreateEnums do
  use Ecto.Migration

  alias TwoWay.{ContactStatusEnum, APIStatusEnum, MessageTypesEnum, MessageFlowEnum}

  def up do
    ContactStatusEnum.create_type()
    APIStatusEnum.create_type()
    MessageTypesEnum.create_type()
    MessageFlowEnum.create_type()
  end

  def down do
    ContactStatusEnum.drop_type()
    APIStatusEnum.drop_type()
    MessageTypesEnum.drop_type()
    MessageFlowEnum.create_type()
  end
end
