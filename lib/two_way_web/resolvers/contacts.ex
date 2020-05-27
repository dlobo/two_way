defmodule TwoWayWeb.Resolvers.Contacts do
  alias TwoWay.{Contacts, Repo, Contacts.Contact}

  def contact(_, %{id: id}, _) do
    with {:ok, contact} <- Repo.fetch(Contact, id),
      do: {:ok, %{contact: contact}}
  end

  def contacts(_, args, _) do
    {:ok, Contacts.list_contacts(args)}
  end

  def contacts_for_language(language, _, _) do
    query = Ecto.assoc(language, :contacts)
    {:ok, Repo.all(query)}
  end

  def create_contact(_, %{input: params}, _) do
    with {:ok, contact} <- Contacts.create_contact(params) do
      {:ok, %{contact: contact}}
    end
  end

  def update_contact(_, %{id: id, input: params}, _) do
    with {:ok, contact} <- Repo.fetch(Contact, id),
         {:ok, contact} <- Contacts.update_contact(contact, params)  do
      {:ok, %{contact: contact}}
    end
  end

  def delete_contact(_, %{id: id}, _) do
    with {:ok, contact} <- Repo.fetch(Contact, id),
         {:ok, contact} <- Contacts.delete_contact(contact)  do
      {:ok, contact}
    end
  end

end
