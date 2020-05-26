defmodule TwoWay.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      # Options are: text, audio, video, image
      add :type, :message_types_enum

      # Options are: inbound, outbound
      add :flow, :string

      # The body of the message
      add :body, :text

      # whats app message id
      add :wa_message_id, :string, null: true

      # options: sent, delivered,read
      add :wa_status, :string

      # sender id
      add :sender_id, references(:contacts, on_delete: :nothing)

      # receipient id
      add :receipient_id, references(:contacts, on_delete: :nothing)

      # message media ids
      add :media_id,  references(:message_media, on_delete: :nothing), null: true

      timestamps()
    end

    create index(:messages, [:sender_id])
    create index(:messages, [:receipient_id])
    create index(:messages, [:media_id])
  end
end
