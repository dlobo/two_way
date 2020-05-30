# Build the enums for ecto to consume in an easy manner
import EctoEnum

require TwoWay.Enums

defenum(
  TwoWay.APIStatusEnum,
  :api_status_enum,
  TwoWay.Enums.api_status_const()
)

defenum(
  TwoWay.ContactStatusEnum,
  :contact_status_enum,
  TwoWay.Enums.contact_status_const()
)

defenum(
  TwoWay.MessageFlowEnum,
  :message_flow_enum,
  TwoWay.Enums.message_flow_const()
)

defenum(
  TwoWay.MessageStatusEnum,
  :message_status_enum,
  TwoWay.Enums.message_status_const()
)

defenum(
  TwoWay.MessageTypesEnum,
  :message_types_enum,
  TwoWay.Enums.message_types_const()
)

defenum(
  TwoWay.SortOrderEnum,
  :sort_order_enum,
  TwoWay.Enums.sort_order_const()
)
