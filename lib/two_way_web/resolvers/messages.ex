defmodule TwoWayWeb.Resolvers.Messages do
  alias TwoWay.{Messages, Repo, Messages.Message}

  def message(_, %{id: id}, _) do
    with {:ok, message} <- Repo.fetch(Message, id),
      do: {:ok, %{message: message}}
  end

  def messages(_, args, _) do
    {:ok, Messages.list_messages(args)}
  end

  def create_message(_, %{input: params}, _) do
    with {:ok, message} <- Messages.create_message(params) do
      {:ok, %{message: message}}
    end
  end

  def update_message(_, %{id: id, input: params}, _) do
    with {:ok, message} <- Repo.fetch(Message, id),
         {:ok, message} <- Messages.update_message(message, params)  do
      {:ok, %{message: message}}
    end
  end

  def delete_message(_, %{id: id}, _) do
    with {:ok, message} <- Repo.fetch(Message, id),
         {:ok, message} <- Messages.delete_message(message)  do
      {:ok, message}
    end
  end

end
