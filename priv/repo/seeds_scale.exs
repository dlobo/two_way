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
alias TwoWay.Messages.{MessageMedia, Message}
alias TwoWay.Contacts.Contact

contacts_list = [
  {"Tarah Bensinger", Enum.random(1234567890..9876543210)},
  {"Ellamae Gwynn", Enum.random(1234567890..9876543210)},
  {"Mafalda Macdougall", Enum.random(1234567890..9876543210)},
  {"Allyson Ishii", Enum.random(1234567890..9876543210)},
  {"Georgianne Buchholtz", Enum.random(1234567890..9876543210)},
  {"Madie Valencia", Enum.random(1234567890..9876543210)},
  {"Angelena Slater", Enum.random(1234567890..9876543210)},
  {"Lynwood Kocian", Enum.random(1234567890..9876543210)},
  {"Sofia Simien", Enum.random(1234567890..9876543210)},
  {"Inge Macdonnell", Enum.random(1234567890..9876543210)},
  {"Gus Sane", Enum.random(1234567890..9876543210)},
  {"Leoma Lesher", Enum.random(1234567890..9876543210)},
  {"Jessie Westerfield", Enum.random(1234567890..9876543210)},
  {"Cameron Parry", Enum.random(1234567890..9876543210)},
  {"Kayleigh Scheffer", Enum.random(1234567890..9876543210)},
  {"Terina Lyon", Enum.random(1234567890..9876543210)},
  {"Robert Balderas", Enum.random(1234567890..9876543210)},
  {"Karisa Felter", Enum.random(1234567890..9876543210)},
  {"Love Hoch", Enum.random(1234567890..9876543210)},
  {"Lorilee Crampton", Enum.random(1234567890..9876543210)},
  {"Ramon Gossage", Enum.random(1234567890..9876543210)},
  {"Parker Quaid", Enum.random(1234567890..9876543210)},
  {"Brittanie Breit", Enum.random(1234567890..9876543210)},
  {"Chasidy Berge", Enum.random(1234567890..9876543210)},
  {"Reba Tarkington", Enum.random(1234567890..9876543210)},
  {"Micheline Saxton", Enum.random(1234567890..9876543210)},
  {"Timmy Jeffords", Enum.random(1234567890..9876543210)},
  {"Treena Kloster", Enum.random(1234567890..9876543210)},
  {"Jesusa Schoenberg", Enum.random(1234567890..9876543210)},
  {"Sherry Pecor", Enum.random(1234567890..9876543210)},
  {"Suzanne Reuter", Enum.random(1234567890..9876543210)},
  {"Keely Labar", Enum.random(1234567890..9876543210)},
  {"Joannie Croley", Enum.random(1234567890..9876543210)},
  {"Kaila Guin", Enum.random(1234567890..9876543210)},
  {"Helena Siewert", Enum.random(1234567890..9876543210)},
  {"Deandrea Tostado", Enum.random(1234567890..9876543210)},
  {"Irina Byham", Enum.random(1234567890..9876543210)},
  {"Bernadine Andreasen", Enum.random(1234567890..9876543210)},
  {"Doug Gunder", Enum.random(1234567890..9876543210)},
  {"Pricilla Bryon", Enum.random(1234567890..9876543210)},
  {"Tamika Maples", Enum.random(1234567890..9876543210)},
  {"Brice Wordlaw", Enum.random(1234567890..9876543210)},
  {"Risa Needles", Enum.random(1234567890..9876543210)},
  {"Francene Eckart", Enum.random(1234567890..9876543210)},
  {"Coral Burroughs", Enum.random(1234567890..9876543210)},
  {"Teri Polley", Enum.random(1234567890..9876543210)},
  {"Spring Kass", Enum.random(1234567890..9876543210)},
  {"Marleen Stickle", Enum.random(1234567890..9876543210)},
  {"Qiana Forrest", Enum.random(1234567890..9876543210)},
  {"Ericka Olszewski", Enum.random(1234567890..9876543210)},
  {"Pok Berrian", Enum.random(123456789..9876543210)},
  {"Bruna Games", Enum.random(123456789..9876543210)},
  {"Ilse Allsup", Enum.random(123456789..9876543210)},
  {"Pedro Camilleri", Enum.random(123456789..9876543210)},
  {"Dwight Crosland", Enum.random(123456789..9876543210)},
  {"Felica Jacome", Enum.random(123456789..9876543210)},
  {"Omar Becher", Enum.random(123456789..9876543210)},
  {"Normand Prettyman", Enum.random(123456789..9876543210)},
  {"Maurice Turnquist", Enum.random(123456789..9876543210)},
  {"Ping Mayfield", Enum.random(123456789..9876543210)},
  {"Era Demar", Enum.random(123456789..9876543210)},
  {"Jaimie Garson", Enum.random(123456789..9876543210)},
  {"Leonor Gowins", Enum.random(123456789..9876543210)},
  {"Adelina Pannell", Enum.random(123456789..9876543210)},
  {"Wilfredo Tardif", Enum.random(123456789..9876543210)},
  {"Jacelyn Delillo", Enum.random(123456789..9876543210)},
  {"Vashti Rusk", Enum.random(123456789..9876543210)},
  {"Carline Nieves", Enum.random(123456789..9876543210)},
  {"Theresa Harries", Enum.random(123456789..9876543210)},
  {"Darcel Mcanulty", Enum.random(123456789..9876543210)},
  {"Latonia Mcduffie", Enum.random(123456789..9876543210)},
  {"Anne Pajak", Enum.random(123456789..9876543210)},
  {"Kristal Asher", Enum.random(123456789..9876543210)},
  {"Delilah Spector", Enum.random(123456789..9876543210)},
  {"Randee Bahr", Enum.random(123456789..9876543210)},
  {"Emely Bardin", Enum.random(123456789..9876543210)},
  {"Elna Melton", Enum.random(123456789..9876543210)},
  {"Anisa Alford", Enum.random(123456789..9876543210)},
  {"Joaquin Bowman", Enum.random(123456789..9876543210)},
  {"Matha Sabine", Enum.random(123456789..9876543210)},
  {"Mayme Wageman", Enum.random(123456789..9876543210)},
  {"Gary Segraves", Enum.random(123456789..9876543210)},
  {"Bernardina Fast", Enum.random(123456789..9876543210)},
  {"Maryanna Funnell", Enum.random(123456789..9876543210)},
  {"Robbie Coolbaugh", Enum.random(123456789..9876543210)},
  {"Palma Sweetman", Enum.random(123456789..9876543210)},
  {"Milagros Shepperd", Enum.random(123456789..9876543210)},
  {"Caitlin Hershberger", Enum.random(123456789..9876543210)},
  {"Mina Pleasant", Enum.random(123456789..9876543210)},
  {"Ebony Aguila", Enum.random(123456789..9876543210)},
  {"Tana Vandorn", Enum.random(123456789..9876543210)},
  {"Inge Fitzgerald", Enum.random(123456789..9876543210)},
  {"Brett Putnam", Enum.random(123456789..9876543210)},
  {"Joesph Kunst", Enum.random(123456789..9876543210)},
  {"Liana Sultan", Enum.random(123456789..9876543210)},
  {"Yasmin Winstead", Enum.random(123456789..9876543210)},
  {"Hailey Wardlaw", Enum.random(123456789..9876543210)},
  {"Chrissy Cron", Enum.random(123456789..9876543210)},
  {"Margarita Quinteros", Enum.random(123456789..9876543210)},
  {"Adelle Cavin", Enum.random(123456789..9876543210)},
]

messages_list = [
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
  {"Test message #{Enum.random(1234567890..9876543210)}"},
]

defmodule TwoWay.Repo.SeedScale do

  def insert_contacts([], acc) do
    acc
  end

  def insert_contacts([head | tail], acc) do

    contact = Repo.insert!(%Contact{
      name: elem(head, 0),
      phone: "#{elem(head, 1)}",
      wa_status: "valid",
      wa_id: "test_wa_id_#{elem(head, 1)}",
      optin_time: DateTime.truncate(DateTime.utc_now(), :second),
      optout_time: DateTime.truncate(DateTime.utc_now(), :second),
      status: "opted_in"
    })

    insert_contacts(tail, [contact.id | acc])

  end

  def insert_messages(contacts, []) do
    "Inserted All Messages"
  end

  def insert_messages([contact_id | contacts_tail], [head | tail]) do

    IO.inspect contact_id

    Repo.insert!(%Message{
      type: "text",
      flow: "inbound",
      body: elem(head, 0),
      wa_status: "delivered",
      sender_id: 1,
      recipient_id: contact_id,
    })

    insert_messages(contacts_tail, tail)

  end

end

TwoWay.Repo.SeedScale.insert_contacts(contacts_list, [])
|> TwoWay.Repo.SeedScale.insert_messages(messages_list)
