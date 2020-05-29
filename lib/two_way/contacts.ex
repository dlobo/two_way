defmodule TwoWay.Contacts do
  @moduledoc """
  The Contacts context.
  """

  import Ecto.Query, warn: false
  alias TwoWay.Repo

  alias TwoWay.Contacts.Contact

  @doc """
  Returns the list of contacts.

  ## Examples

      iex> list_contacts()
      [%Contact{}, ...]

  """
  def list_contacts(args \\ %{}) do
    args
    |> Enum.reduce(Contact, fn
      {:order, order}, query ->
        query |> order_by({^order, :name})
      {:filter, filter}, query ->
        query |> filter_with(filter)
    end)
    |> Repo.all
  end

  defp filter_with(query, filter) do
    Enum.reduce(filter, query, fn
      {:name, name}, query ->
        from q in query, where: ilike(q.name, ^"%#{name}%")
      {:phone, phone }, query ->
        from q in query, where: ilike(q.phone, ^"%#{phone}%")
      {:wa_id, wa_id }, query ->
        from q in query, where: ilike(q.wa_id, ^"%#{wa_id}%")
      {:status, status }, query ->
        from q in query, where: q.status ==  ^status
      {:wa_status, wa_status }, query ->
        from q in query, where: q.wa_status ==  ^wa_status
    end)
  end

  @doc """
  Gets a single contact.

  Raises `Ecto.NoResultsError` if the Contact does not exist.

  ## Examples

      iex> get_contact!(123)
      %Contact{}

      iex> get_contact!(456)
      ** (Ecto.NoResultsError)

  """
  def get_contact!(id), do: Repo.get!(Contact, id)

  @doc """
  Creates a contact.

  ## Examples

      iex> create_contact(%{field: value})
      {:ok, %Contact{}}

      iex> create_contact(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_contact(attrs \\ %{}) do
    %Contact{}
    |> Contact.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a contact.

  ## Examples

      iex> update_contact(contact, %{field: new_value})
      {:ok, %Contact{}}

      iex> update_contact(contact, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_contact(%Contact{} = contact, attrs) do
    contact
    |> Contact.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a contact.

  ## Examples

      iex> delete_contact(contact)
      {:ok, %Contact{}}

      iex> delete_contact(contact)
      {:error, %Ecto.Changeset{}}

  """
  def delete_contact(%Contact{} = contact) do
    Repo.delete(contact)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking contact changes.

  ## Examples

      iex> change_contact(contact)
      %Ecto.Changeset{data: %Contact{}}

  """
  def change_contact(%Contact{} = contact, attrs \\ %{}) do
    Contact.changeset(contact, attrs)
  end

  def get_or_create(attrs) do
    Repo.insert!(
      change_contact(%Contact{}, attrs),
      on_conflict: [set: [phone: attrs.phone]],
      conflict_target: :phone
    )
    # with nil            <- Repo.get_by(Contact, %{phone: attrs.phone}),
    #   {:ok, contact} <- create_contact(attrs) do
    #      contact
    # end
  end
end
