defmodule TwoWayWeb.Schema.ContactTypes do
  use Absinthe.Schema.Notation

  alias TwoWayWeb.{Resolvers}

  object :contact_result do
    field :contact, :contact
    field :errors, list_of(:input_error)
  end

  object :contact do
    field :id, :id
    field :name, :string
    field :phone, :string
    field :wa_id, :string

    field :status, :contact_status_enum
    field :wa_status, :contact_status_enum

    field :optin_time, :datetime
    field :optout_time, :datetime
  end

  @desc "Filtering options for contacts"
  input_object :contact_filter do
    @desc "Match the name"
    field :name, :string

    @desc "Match the phone"
    field :phone, :string
    field :wa_id, :string

    @desc "Match the status"
    field :status, :contact_status_enum
    field :wa_status, :contact_status_enum
  end

  input_object :contact_input do
    field :name, :string
    field :phone, :string
    field :wa_id, :string
    field :status, :contact_status_enum
    field :wa_status, :contact_status_enum
  end

  object :contact_queries do
    @desc "get the details of one contact"
    field :contact, :contact_result do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Contacts.contact/3)
    end

    @desc "Get a list of all contacts filtered by various criteria"
    field :contacts, list_of(:contact) do
      arg(:filter, :contact_filter)
      arg(:order, type: :sort_order, default_value: :asc)
      resolve(&Resolvers.Contacts.contacts/3)
    end
  end

  object :contact_mutations do
    field :create_contact, :contact_result do
      arg(:input, non_null(:contact_input))
      resolve(&Resolvers.Contacts.create_contact/3)
    end

    field :update_contact, :contact_result do
      arg(:id, non_null(:id))
      arg(:input, :contact_input)
      resolve(&Resolvers.Contacts.update_contact/3)
    end

    field :delete_contact, :contact_result do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Contacts.delete_contact/3)
    end
  end
end
