# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TwoWay.Repo.insert!(%TwoWay.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias TwoWay.Repo
alias TwoWay.{Settings.Language, Attributes.Tag, Contacts.Contact}

en_us =
  Repo.insert!(%Language{
    label: "English (United States)",
    locale: "en_US"
  })

hi_in =
  Repo.insert!(%Language{
    label: "Hindi (India)",
    locale: "hi_IN"
  })

messageTags_EN = Repo.insert!(%Tag{label: "Messages", language: en_us})
messageTags_HI = Repo.insert!(%Tag{label: "Messages", language: hi_in})

Repo.insert!(%Tag{label: "Welcome", language: en_us, parent_id: messageTags_EN.id})
Repo.insert!(%Tag{label: "Greeting", language: en_us, parent_id: messageTags_EN.id})
Repo.insert!(%Tag{label: "Thank You", language: en_us, parent_id: messageTags_EN.id})
Repo.insert!(%Tag{label: "Welcome", language: hi_in, parent_id: messageTags_HI.id})
Repo.insert!(%Tag{label: "Greeting", language: hi_in, parent_id: messageTags_HI.id})
Repo.insert!(%Tag{label: "Thank You", language: hi_in, parent_id: messageTags_HI.id})

Repo.insert!(%Contact{phone: "917834811114", name: "Default Contact"})
