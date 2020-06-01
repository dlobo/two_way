defmodule TwoWayWeb.Resolvers.Organizations do
  alias TwoWay.{Organizations, Repo, Organizations.Organization}

  def organization(_, %{id: id}, _) do
    with {:ok, organization} <- Repo.fetch(Organization, id),
         do: {:ok, %{organization: organization}}
  end

  def organizations(_, args, _) do
    {:ok, Organizations.list_organizations(args)}
  end

  def create_organization(_, %{input: params}, _) do
    with {:ok, organization} <- Organizations.create_organization(params) do

      {:ok, %{organization: organization}}
    end
  end

  def update_organization(_, %{id: id, input: params}, _) do
    with {:ok, organization} <- Repo.fetch(Organization, id),
         {:ok, organization} <- Organizations.update_organization(organization, params) do
      {:ok, %{organization: organization}}
    end
  end

  def delete_organization(_, %{id: id}, _) do
    with {:ok, organization} <- Repo.fetch(Organization, id),
         {:ok, organization} <- Organizations.delete_organization(organization) do
      {:ok, organization}
    end
  end
end
