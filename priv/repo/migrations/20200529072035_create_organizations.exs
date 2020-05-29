defmodule TwoWay.Repo.Migrations.CreateOrganizations do
  use Ecto.Migration

  def change do
    create table(:organizations) do
      add :name, :string
      add :contact_name, :string
      add :email, :string
      add :bsp, :string
      add :bsp_key, :string
      add :wa_number, :string

      timestamps()
    end

  end
end
