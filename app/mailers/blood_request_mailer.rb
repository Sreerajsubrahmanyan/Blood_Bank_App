class BloodRequestMailer < ApplicationMailer
  def notify_requester(user, message)
    @message = message
    mail(to: user.email, subject: "Your Blood Request Has Been Accepted")
  end
end
