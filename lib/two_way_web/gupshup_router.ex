defmodule TwoWayWeb.GupshupRouter do
  use TwoWayWeb, :router

  @doc """
  Need to match the following type specs from the gupshup documentation
  # type
  user-event
    # payload.type
    sandbox-start
    opted-in      # payload.type == opted-in
    opted-out     # payload.type == opted-out
  message-event   $ type == message-event
    # payload.type
    enqueued
    failed
    sent
    delivered
    read
  message
    # payload.type
    text
    image
    file
    audio
    video
    contact
    location
  """
  scope "/gupshup", TwoWayWeb do

    scope "/user-event" do
      post("/"             , GupshupController, :user_event)
      post("/sandbox-start", GupshupController, :sandbox_start)
      post("/opted-in"     , GupshupController, :opted_in)
      post("/opted-out"    , GupshupController, :opted_out)
    end

    scope "/message-event" do
      post("/"         , GupshupController, :message_event)
      post("/enqueued" , GupshupController, :enqueued)
      post("/failed"   , GupshupController, :failed)
      post("/sent"     , GupshupController, :sent)
      post("/delivered", GupshupController, :delivered)
    end

    scope "/message" do
      post("/"        , GupshupController, :message)
      post("/text"    , GupshupController, :text)
      post("/image"   , GupshupController, :image)
      post("/file"    , GupshupController, :file)
      post("/audio"   , GupshupController, :audio)
      post("/video"   , GupshupController, :video)
      post("/contact" , GupshupController, :contact)
      post("/location", GupshupController, :location)
    end

    post("/unknown"      , GupshupController, :unknown)
  end
end
