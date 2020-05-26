defmodule TwoWayWeb.ContactController do
  use TwoWayWeb, :controller

  alias TwoWay.Messages
  alias TwoWay.Messages.Contact

  def index(conn, _params) do
    contacts = Messages.list_contacts()
    render(conn, "index.html", contacts: contacts)
  end

  def new(conn, _params) do
    changeset = Messages.change_contact(%Contact{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"contact" => contact_params}) do
    case Messages.create_contact(contact_params) do
      {:ok, contact} ->
        conn
        |> put_flash(:info, "Contact created successfully.")
        |> redirect(to: Routes.contact_path(conn, :show, contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    contact = Messages.get_contact!(id)
    render(conn, "show.html", contact: contact)
  end

  def edit(conn, %{"id" => id}) do
    contact = Messages.get_contact!(id)
    changeset = Messages.change_contact(contact)
    render(conn, "edit.html", contact: contact, changeset: changeset)
  end

  def update(conn, %{"id" => id, "contact" => contact_params}) do
    contact = Messages.get_contact!(id)

    case Messages.update_contact(contact, contact_params) do
      {:ok, contact} ->
        conn
        |> put_flash(:info, "Contact updated successfully.")
        |> redirect(to: Routes.contact_path(conn, :show, contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", contact: contact, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    contact = Messages.get_contact!(id)
    {:ok, _contact} = Messages.delete_contact(contact)

    conn
    |> put_flash(:info, "Contact deleted successfully.")
    |> redirect(to: Routes.contact_path(conn, :index))
  end
end
