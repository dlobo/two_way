defmodule TwoWay.Messages do
  @moduledoc """
  The Messages context.
  """

  import Ecto.Query, warn: false
  alias TwoWay.Repo

  alias TwoWay.Messages.Contact

  @doc """
  Returns the list of contacts.

  ## Examples

      iex> list_contacts()
      [%Contact{}, ...]

  """
  def list_contacts do
    Repo.all(Contact)
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

  alias TwoWay.Messages.MessageMedia

  @doc """
  Returns the list of message_media.

  ## Examples

      iex> list_message_media()
      [%MessageMedia{}, ...]

  """
  def list_message_media do
    Repo.all(MessageMedia)
  end

  @doc """
  Gets a single message_media.

  Raises `Ecto.NoResultsError` if the Message media does not exist.

  ## Examples

      iex> get_message_media!(123)
      %MessageMedia{}

      iex> get_message_media!(456)
      ** (Ecto.NoResultsError)

  """
  def get_message_media!(id), do: Repo.get!(MessageMedia, id)

  @doc """
  Creates a message_media.

  ## Examples

      iex> create_message_media(%{field: value})
      {:ok, %MessageMedia{}}

      iex> create_message_media(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_message_media(attrs \\ %{}) do
    %MessageMedia{}
    |> MessageMedia.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a message_media.

  ## Examples

      iex> update_message_media(message_media, %{field: new_value})
      {:ok, %MessageMedia{}}

      iex> update_message_media(message_media, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_message_media(%MessageMedia{} = message_media, attrs) do
    message_media
    |> MessageMedia.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a message_media.

  ## Examples

      iex> delete_message_media(message_media)
      {:ok, %MessageMedia{}}

      iex> delete_message_media(message_media)
      {:error, %Ecto.Changeset{}}

  """
  def delete_message_media(%MessageMedia{} = message_media) do
    Repo.delete(message_media)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking message_media changes.

  ## Examples

      iex> change_message_media(message_media)
      %Ecto.Changeset{data: %MessageMedia{}}

  """
  def change_message_media(%MessageMedia{} = message_media, attrs \\ %{}) do
    MessageMedia.changeset(message_media, attrs)
  end

  alias TwoWay.Messages.Message

  @doc """
  Returns the list of messages.

  ## Examples

      iex> list_messages()
      [%Message{}, ...]

  """
  def list_messages do
    Repo.all(Message)
  end

  @doc """
  Gets a single message.

  Raises `Ecto.NoResultsError` if the Message does not exist.

  ## Examples

      iex> get_message!(123)
      %Message{}

      iex> get_message!(456)
      ** (Ecto.NoResultsError)

  """
  def get_message!(id), do: Repo.get!(Message, id)

  @doc """
  Creates a message.

  ## Examples

      iex> create_message(%{field: value})
      {:ok, %Message{}}

      iex> create_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a message.

  ## Examples

      iex> update_message(message, %{field: new_value})
      {:ok, %Message{}}

      iex> update_message(message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_message(%Message{} = message, attrs) do
    message
    |> Message.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a message.

  ## Examples

      iex> delete_message(message)
      {:ok, %Message{}}

      iex> delete_message(message)
      {:error, %Ecto.Changeset{}}

  """
  def delete_message(%Message{} = message) do
    Repo.delete(message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking message changes.

  ## Examples

      iex> change_message(message)
      %Ecto.Changeset{data: %Message{}}

  """
  def change_message(%Message{} = message, attrs \\ %{}) do
    Message.changeset(message, attrs)
  end
end
