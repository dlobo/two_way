defmodule TwoWay.Constants.Enums do
  @moduledoc """
  The Enums constant are where all enum values across our entire
  application should be defined. This is the source of truth for
  all enums
  """

  defmacro __using__(_opts) do
    quote do
      @contact_status_const [:failed, :invalid, :processing, :valid]
      @message_types_const [:audio, :contact, :document, :hsm, :image, :location, :text, :video]
      @message_flow_const [:inbound, :outbound]
    end
  end
end
