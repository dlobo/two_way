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

language = Repo.insert! %OptionGroup {
  name:      "language",
  label: "Language",
  data_type: "String"
}

Repo.insert! %OptionValue {
  label: "English (United States)",
  value: "en_US",
  weight: 1,

  option_group: language
}
