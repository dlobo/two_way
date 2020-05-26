defmodule TwoWay.Repo.Migrations.AddTwowayTables do
  use Ecto.Migration

  def change do
    option_groups()

    option_values()

    languages()

    tags()

    session_messages()
  end

  @doc """
  Generic Table to store groups of {label, value} tuples along with a bunch of auxilary
  attributes. Initially will be used for languages, but this structure gives us the
  flexibility of making everthing user-customizable which is important.

  Concept and table columns borrowed from CiviCRM
  """
  def option_groups() do
    create table(:option_groups) do
      # Use as key by functions which lookup options in option_value
      add :name, :string, null: false
      # The descriptive name of this group
      add :label, :string, null: false
      # Optional text describing the usage of this group
      add :description, :string, null: true
      # Since everything is a string, this field allows us to do type conversion
      add :data_type, :string, null: true
      # Indicator that this group cannot be modified
      add :is_locked, :boolean, default: true
      # Indicator that this group is in active use
      add :is_active, :boolean, default: true
      # Indicator that the core code depends on the existence of this group
      add :is_reserved, :boolean, default: false

      timestamps()
    end

    create unique_index(:option_groups, :name)
  end

  @doc """
  This tables stores all the values for each opion group. The application code maintains referential integrity
  for the option_{group,value} tables
  """
  def option_values() do
    create table(:option_values) do
      # String displayed to the User
      add :label, :string, null: false
      # Optional text describing the usage of this value
      add :description, :string, null: true

      # The actual value stored (as a foreign key) in the data record. Functions which need lookup option_value.label should use civicrm_option_value.option_group_id plus civicrm_option_value.value as the key
      add :value, :string, null: false
      # Use to sort and/or set display properties for sub-set(s) of options within an option group
      add :grouping, :string, null: true

      # Bitwise logic can be used to create subsets of options within an option_group for different uses.
      add :filter, :integer
      # Controls display order
      add :weight, :integer, null: false
      # Is this the default option for the group
      add :is_default, :boolean, default: false

      # Is this row simply a display header? Expected usage is to render these as OPTGROUP tags within a SELECT field list of options?
      add :is_optgroup, :boolean, default: false
      # Is this value being currently used
      add :is_active, :boolean, default: true
      # Is this a predefined system object?
      add :is_reserved, :boolean, default: false

      add :option_group_id, references(:option_groups), null: false, on_delete: :restrict

      timestamps()
    end

    create unique_index(:option_values, [:label, :option_group_id])
  end

  @doc """
  Since Language is such an important part of the conversation, lets givve language its
  own table. This allows us to optimize and switch languages relatively quickly
  """
  def languages() do
    create table(:languages) do
      # The language label, typically the full name, like English (US) or Hindi
      add :label, :string, null: false
      # An optional description
      add :description, :string, null: true

      # The locale name of the language dialect, e.g. en_US, or hi_IN
      add :locale, :string, null: false

      # Is this language being currently used in the sysem
      add :is_active, :boolean, default: true

      timestamps()
    end

    create unique_index(:languages, :label )
    create unique_index(:languages, :locale)

  end

  @doc """
  Multiple entities within the system like to be tagged. For e.g. Messages and Message Templates
  can be either manually tagged or automatically tagged.
  """
  def tags() do
    create table(:tags) do
      # The tag label
      add :label, :string, null: false
      # An optional description
      add :description, :string, null: true

      # Is this value being currently used
      add :is_active, :boolean, default: true
      # Is this a predefined system object?
      add :is_reserved, :boolean, default: false

      # foreign key to  option_value:value column with the option_group.name being "language"
      add :language_id, references(:languages), null: false, on_delete: :restrict

      # All child tags point to the parent tag, this allows us a to organize tags as needed
      add :parent_id, references(:tags), null: true, on_delete: :nilify_all

      timestamps()
    end

    create unique_index(:tags, [:label, :language_id])
  end

  @doc """
  Store a set of predefined messages that the organization communicates to its users
  on a regular basis.

  Handle multiple versions of the message for different languages
  """
  def session_messages() do
    create table(:session_messages) do
      # The message label
      add :label, :string, null: false
      # The body of the message
      add :body, :text, null: false
      # Is this a predefined system object?
      add :is_reserved, :boolean, default: false
      # Is this value being currently used
      add :is_active, :boolean, default: true
      # Is this the original root message
      add :is_source, :boolean, default: false
      # Is this translation machine-generated
      add :is_translated, :boolean, default: false

      # Messages are in a specific language
      add :language_id, references(:languages), null: false, on_delete: :restrict

      # All child messages point to the root message, so we can propagate changes downstream
      add :parent_id, references(:session_messages), null: true, on_delete: :nilify_all

      # Message templates can be tagged
      add :tag_id, references(:tags), null: true, on_delete: :nilify_all

      timestamps()
    end

    create unique_index(:session_messages, [:label, :language_id])
  end

  @doc """
  Minimal set of information to store for a Contact to record its interaction
  at a high level. Typically messaging apps dont have detailed information, and if
  they do, we'll redirect those requests to a future version of the CRMPlatform
  """
  def contacts() do
    create table(:contacts) do
      # Contact Name
      add :name, :string, null: false

      # Contact Phone (this is the primary point of identification)
      add :phone, :string, null: false

      # whatsapp status
      # the current options are: processing, valid, invalid, failed
      add :wa_status, :string, null: false

      # whatsapp id
      # this is relevant only if wa_status is valid
      add :wa_id, :string

      # Is this contact active (for some definition of active)
      add :is_active, :boolean, default: true

      # this is our status, based on what the BSP tell us
      # the current options are: valid or invalid
      add :status     , :string     , null: false, default: "valid"
      add :optin_time , :timestamptz
      add :optout_time, :timestamptz

      timestamps()
    end

    create unique_index(:contacts, :phone)
    create unique_index(:contacts, :wa_id)
  end

end
