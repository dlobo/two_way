defmodule TwoWay.Repo.Migrations.CreateEnums do
  use Ecto.Migration

  alias TwoWay.{ContactStatusEnum, MessageTypesEnum}

  def up do
    ContactStatusEnum.create_type()
    MessageTypesEnum.create_type()
  end

  def down do
    ContactStatusEnum.drop_type()
    MessageTypesEnum.drop_type()
  end
end
