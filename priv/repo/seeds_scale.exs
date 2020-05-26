# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds_scale.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TwoWay.Repo.insert!(%TwoWay.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias TwoWay.Repo
alias TwoWay.Messages.{Contact, MessageMedia, Message}

sender =
  Repo.insert!(%Contact{
    name: "John Doe",
    phone_number: "+919999999999",
    status: "opted_in"
  })

receipient =
  Repo.insert!(%Contact{
    name: "Jane Doe",
    phone_number: "+918888888888",
    status: "opted_in"
  })

Repo.insert(%Message{
  type: "text",
  flow: "inbound",
  body: "test message",
  sender_id: sender.id,
  receipient_id: receipient.id,
  wa_message_id: nil
})
