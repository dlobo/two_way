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
alias TwoWay.Messages.Message
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

defmodule TwoWay.Repo.SeedScale do

  @doc """
  Anshul: PLease rewrite this as an Enum.map statement, something like
  Enum.map(contacts_list, fn c -> insert_contact(c) end  )
  """

  defp insert_contact(contact) do
    {name, phone} = contact
    contact = Repo.insert!(%Contact{
      name: name,
      phone: Integer.to_string(phone),
      wa_status: "valid",
      wa_id: "test_wa_id_#{phone}",
      optin_time: DateTime.truncate(DateTime.utc_now(), :second),
      optout_time: DateTime.truncate(DateTime.utc_now(), :second),
      status: "valid"
    })

    contact.id

  end

  def insert_contacts(contacts_list) do

    Enum.map(contacts_list, fn c -> insert_contact(c) end)

  end

  defp create_message(1), do: Faker.Lorem.Shakespeare.as_you_like_it()
  defp create_message(2), do: Faker.Lorem.Shakespeare.hamlet()
  defp create_message(3), do: Faker.Lorem.Shakespeare.king_richard_iii()
  defp create_message(4), do: Faker.Lorem.Shakespeare.romeo_and_juliet()

  def create_messages(len, messages_list) when len <= 0, do: messages_list
  def create_messages(len, messages_list) do
    create_messages(len - 1, [create_message(Enum.random(1..4)) | messages_list])
  end

  def insert_messages(_contacts, [], _, messages_list), do: messages_list
  def insert_messages(contacts_ids, [head | tail], "ngo", messages_list) do

    {:ok, contact_id} = Enum.fetch(contacts_ids, Enum.random(1..99))

    messages_list = [
      %{
        type: "text",
        flow: "inbound",
        body: head,
        wa_status: "delivered",
        sender_id: 1,
        recipient_id: contact_id,
        inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
        updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
      }
      | messages_list
    ]

    insert_messages(contacts_ids, tail, "beneficiary", messages_list)

  end

  def insert_messages(contacts_ids, [head | tail], "beneficiary", messages_list) do

    {:ok, contact_id} = Enum.fetch(contacts_ids, Enum.random(1..99))

    messages_list = [
      %{
        type: "text",
        flow: "inbound",
        body: head,
        wa_status: "delivered",
        sender_id: contact_id,
        recipient_id: 1,
        inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
        updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
      }
      | messages_list
    ]

    insert_messages(contacts_ids, tail, "ngo", messages_list)

  end

end

# postgresql protocol can not handle more than 65535 parameters for bulk insert
# create list of messages
messages_list = TwoWay.Repo.SeedScale.create_messages(5000, [])

# seed contacts
contacts_ids = TwoWay.Repo.SeedScale.insert_contacts(contacts_list)

# create message entries for contacts
message_entries = TwoWay.Repo.SeedScale.insert_messages(contacts_ids, messages_list, "ngo", [])

# seed messages
Repo.insert_all(Message, message_entries)
