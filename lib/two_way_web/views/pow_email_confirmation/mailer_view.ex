defmodule TwoWayWeb.PowEmailConfirmation.MailerView do
  use TwoWayWeb, :mailer_view

  def subject(:email_confirmation, _assigns), do: "Confirm your email address"
end
