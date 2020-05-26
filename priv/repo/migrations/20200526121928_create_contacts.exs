defmodule TwoWay.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :name, :text
      add :phone_number, :text
      add :status, :string

      timestamps()
    end

  end
end
