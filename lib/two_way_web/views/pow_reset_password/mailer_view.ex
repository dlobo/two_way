defmodule TwoWayWeb.PowResetPassword.MailerView do
  use TwoWayWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
