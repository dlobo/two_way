defmodule TwoWay.Settings do
  @moduledoc """
  The Settings context.
  """

  import Ecto.Query, warn: false
  alias TwoWay.Repo

  alias TwoWay.Settings.OptionGroup

  @doc """
  Returns the list of option_groups.

  ## Examples

      iex> list_option_groups()
      [%OptionGroup{}, ...]

  """
  def list_option_groups do
    Repo.all(OptionGroup)
  end

  @doc """
  Gets a single option_group.

  Raises `Ecto.NoResultsError` if the Option group does not exist.

  ## Examples

      iex> get_option_group!(123)
      %OptionGroup{}

      iex> get_option_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_option_group!(id), do: Repo.get!(OptionGroup, id)

  @doc """
  Creates a option_group.

  ## Examples

      iex> create_option_group(%{field: value})
      {:ok, %OptionGroup{}}

      iex> create_option_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_option_group(attrs \\ %{}) do
    %OptionGroup{}
    |> OptionGroup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a option_group.

  ## Examples

      iex> update_option_group(option_group, %{field: new_value})
      {:ok, %OptionGroup{}}

      iex> update_option_group(option_group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_option_group(%OptionGroup{} = option_group, attrs) do
    option_group
    |> OptionGroup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a option_group.

  ## Examples

      iex> delete_option_group(option_group)
      {:ok, %OptionGroup{}}

      iex> delete_option_group(option_group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_option_group(%OptionGroup{} = option_group) do
    Repo.delete(option_group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking option_group changes.

  ## Examples

      iex> change_option_group(option_group)
      %Ecto.Changeset{data: %OptionGroup{}}

  """
  def change_option_group(%OptionGroup{} = option_group, attrs \\ %{}) do
    OptionGroup.changeset(option_group, attrs)
  end

  alias TwoWay.Settings.OptionValue

  @doc """
  Returns the list of option_values.

  ## Examples

      iex> list_option_values()
      [%OptionValue{}, ...]

  """
  def list_option_values do
    Repo.all(OptionValue)
  end

  @doc """
  Gets a single option_value.

  Raises `Ecto.NoResultsError` if the Option value does not exist.

  ## Examples

      iex> get_option_value!(123)
      %OptionValue{}

      iex> get_option_value!(456)
      ** (Ecto.NoResultsError)

  """
  def get_option_value!(id), do: Repo.get!(OptionValue, id)

  @doc """
  Creates a option_value.

  ## Examples

      iex> create_option_value(%{field: value})
      {:ok, %OptionValue{}}

      iex> create_option_value(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_option_value(attrs \\ %{}) do
    %OptionValue{}
    |> OptionValue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a option_value.

  ## Examples

      iex> update_option_value(option_value, %{field: new_value})
      {:ok, %OptionValue{}}

      iex> update_option_value(option_value, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_option_value(%OptionValue{} = option_value, attrs) do
    option_value
    |> OptionValue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a option_value.

  ## Examples

      iex> delete_option_value(option_value)
      {:ok, %OptionValue{}}

      iex> delete_option_value(option_value)
      {:error, %Ecto.Changeset{}}

  """
  def delete_option_value(%OptionValue{} = option_value) do
    Repo.delete(option_value)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking option_value changes.

  ## Examples

      iex> change_option_value(option_value)
      %Ecto.Changeset{data: %OptionValue{}}

  """
  def change_option_value(%OptionValue{} = option_value, attrs \\ %{}) do
    OptionValue.changeset(option_value, attrs)
  end
end
