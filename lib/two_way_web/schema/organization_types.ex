defmodule TwoWayWeb.Schema.OrganizationTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias TwoWay.{Organizations.BSP}
  alias TwoWayWeb.{Resolvers}

  object :organization_result do
    field :organization, :organization
    field :errors, list_of(:input_error)
  end

  object :organization do
    field :id, :id
    field :name, :string
    field :bsp_key, :string
    field :contact_name, :string
    field :email, :string
    field :wa_number, :string

    field :bsp, :bsp do
      resolve(dataloader(BSP))
    end
  end

  @desc "Filtering options for organizations"
  input_object :organization_filter do
    @desc "Match the name"
    field :name, :string

    @desc "Match the email"
    field :email, :string

    field :contact_name, :string
    field :bsp, :string
    field :bsp_key, :string
    field :wa_number, :string
  end

  input_object :organization_input do
    field :name, :string
    field :contact_name, :string
    field :email, :string
    field :bsp, :string
    field :bsp_key, :string
    field :wa_number, :string
  end

  object :organization_queries do
    @desc "get the details of one organization"
    field :organization, :organization_result do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Organizations.organization/3)
    end

    @desc "Get a list of all organizations filtered by various criteria"
    field :organizations, list_of(:organization) do
      arg(:filter, :organization_filter)
      arg(:order, type: :sort_order, default_value: :asc)
      resolve(&Resolvers.Organizations.organizations/3)
    end
  end

  object :organization_mutations do
    field :create_organization, :organization_result do
      arg(:input, non_null(:organization_input))
      resolve(&Resolvers.Organizations.create_organization/3)
    end

    field :update_organization, :organization_result do
      arg(:id, non_null(:id))
      arg(:input, :organization_input)
      resolve(&Resolvers.Organizations.update_organization/3)
    end

    field :delete_organization, :organization_result do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Organizations.delete_organization/3)
    end
  end
end
