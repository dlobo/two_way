defmodule TwoWayWeb.Schema do
  use Absinthe.Schema

  alias TwoWay.Attributes.Tag
  alias TwoWay.Messages.Message
  alias TwoWay.Contacts.Contact
  alias TwoWay.Organizations.Organization
  alias TwoWay.Organizations.BSP
  alias TwoWay.MessagesTags.MessageTag

  alias TwoWayWeb.Schema.Middleware

  def middleware(middleware, _field, %{identifier: :mutation}) do
    middleware ++ [Middleware.ChangesetErrors]
  end

  def middleware(middleware, _field, %{identifier: :query}) do
    middleware ++ [Middleware.ChangesetErrors]
  end

  def middleware(middleware, _field, _object) do
    middleware
  end

  import_types(Absinthe.Type.Custom)

  import_types(__MODULE__.EnumTypes)
  import_types(__MODULE__.GenericTypes)
  import_types(__MODULE__.LanguageTypes)
  import_types(__MODULE__.TagTypes)
  import_types(__MODULE__.ContactTypes)
  import_types(__MODULE__.MessageTypes)
  import_types(__MODULE__.MessageMediaTypes)
  import_types(__MODULE__.MessageTagTypes)
  import_types(__MODULE__.OrganizationTypes)
  import_types(__MODULE__.BSPTypes)

  query do
    import_fields(:language_queries)

    import_fields(:tag_queries)

    import_fields(:contact_queries)

    import_fields(:message_media_queries)

    import_fields(:message_queries)

    import_fields(:message_tag_queries)

    import_fields(:organization_queries)

    import_fields(:bsp_queries)

  end

  mutation do
    import_fields(:language_mutations)

    import_fields(:tag_mutations)

    import_fields(:contact_mutations)

    import_fields(:message_media_mutations)

    import_fields(:message_mutations)

    import_fields(:message_tag_mutations)

    import_fields(:organization_mutations)

    import_fields(:bsp_mutations)

  end

  subscription do
    import_fields(:message_subscriptions)
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Tag, Tag.data())
      |> Dataloader.add_source(Message, Message.data())
      |> Dataloader.add_source(Contact, Contact.data())
      |> Dataloader.add_source(MessageTag, MessageTag.data())
      |> Dataloader.add_source(Organization, Organization.data())
      |> Dataloader.add_source(BSP, BSP.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
