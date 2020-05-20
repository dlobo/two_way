defmodule TwoWayWeb.GupshupRouter do
  use TwoWayWeb, :router

  scope "/gupshup", TwoWayWeb do
    post("/user-event"   , GupshupController, :user_event)
    post("/message-event", GupshupController, :message_event)
    post("/message"      , GupshupController, :message)
    post("/unknown"      , GupshupController, :unknown)
  end
end
