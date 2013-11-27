class NotificationsMailer < ActionMailer::Base

  default :from => "info@mastercoin.org"
  default :to => "peter_vd_berg@hotmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[Mastercoin.org], #{message.subject}")
  end

end