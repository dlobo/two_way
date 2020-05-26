defmodule TwoWay.WhatsApp.MessageBuilder do
  @doc """
   Invoked when a request runs.

   Build all the injections and helper functions for the communication
   """
   defmacro __using__(_opts \\ []) do

     quote do
       @bsp TwoWay.WhatsApp.Message.effective_bsp()
       @sender TwoWay.WhatsApp.Message.effective_sender()

       def send_message(payload, receiver) do
        @bsp
        |> apply( :send_message, [payload, @sender, receiver])
       end

       def send_video_message(payload, receiver) do
        @bsp
        |> apply( :send_video_message, [payload, @sender, receiver])
       end

       def send_image_message(payload, receiver) do
        @bsp
        |> apply( :send_image_message, [payload, @sender, receiver])
       end

       def send_file_message(payload, receiver) do
        @bsp
        |> apply(:send_file_message, [payload, @sender, receiver])
       end

     end
   end

 end
