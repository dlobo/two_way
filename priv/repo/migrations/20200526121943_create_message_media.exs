defmodule TwoWay.Repo.Migrations.CreateMessageMedia do
  use Ecto.Migration

  def change do
    create table(:message_media) do
      # url
      add :url, :text

      # original_url
      add :original_url, :text

      # thumbnail url
      add :thumbnail, :text

      # caption of the media
      add :caption, :text

      # whats app message id
      add :wa_media_id, :string

      timestamps()
    end

  end
end
