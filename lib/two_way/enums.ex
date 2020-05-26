defmodule TwoWay.Enums do
  @moduledoc """
  The Enum provides a location for all enum related macros
  """

  use TwoWay.Constants.Enums

  defmacro contact_status_const,
    do: Macro.expand(@contact_status_const, __CALLER__)

  defmacro message_types_const,
    do: Macro.expand(@message_types_const, __CALLER__)

end
