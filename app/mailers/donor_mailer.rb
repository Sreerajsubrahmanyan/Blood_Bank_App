class DonorMailer < ApplicationMailer
  def request_email(user, donation, message)
    @user = user
    @donation = donation
    @message = message
    mail(
      from: @user.email,
      to: @donation.user.email,
      subject: "Blood Donation Request from #{@user.username}"
    )
  end
end
