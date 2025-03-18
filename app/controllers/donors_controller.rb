class DonorsController < ApplicationController
  before_action :authenticate_user!

  def send_request_form
    @donation = Donation.find(params[:id])
  end


  def send_request
    @donation = Donation.find(params[:id])
    @message = params[:message]

    DonorMailer.request_email(current_user, @donation, @message).deliver_now

    flash[:notice] = "Your request has been sent to #{@donation.user.username}."
    redirect_to root_path
  end
end
