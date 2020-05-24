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
alias TwoWay.{Settings.OptionGroup, Settings.OptionValue, Attributes.Tag, Content.SessionMessage}

en_us =
  Repo.insert!(%Language{
        label: "English (United States)",
        name: "en_US",
 })
hi_in =
  Repo.insert!(%Language{
    label: "Hindi (India)",
    name: "hi_IN",
  })


Repo.insert!(%Tag{label: "Welcome", language: en_us})
Repo.insert!(%Tag{label: "Greeting", language: en_us})
Repo.insert!(%Tag{label: "Thank You", language: en_us})
Repo.insert!(%Tag{label: "Welcome", language: hi_in})
Repo.insert!(%Tag{label: "Greeting", language: hi_in})
Repo.insert!(%Tag{label: "Thank You", language: hi_in})
