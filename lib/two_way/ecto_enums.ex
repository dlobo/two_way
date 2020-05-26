# Build the enums for ecto to consume in an easy manner
import EctoEnum

require TwoWay.Enums

defenum(TwoWay.ContactStatusEnum,
  :contact_status_enum,
  TwoWay.Enums.contact_status_const())

defenum(TwoWay.MessageTypesEnum,
  :message_types_enum,
  TwoWay.Enums.message_types_const())
