class BloodRequestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @blood_request = BloodRequest.new
  end

  def create
    @blood_request = current_user.blood_requests.build(blood_request_params)
    if @blood_request.save
      redirect_to root_path, notice: "Blood request created successfully!"
    else
      render :new
    end
  end

  def index
    @requests = BloodRequest.where(accepted: false)
  end

  def update
    @blood_request = BloodRequest.find(params[:id])
    @blood_request.update(accepted: true)
    redirect_to root_path, notice: "You accepted a blood request!"
  end

  def accept
    @request = BloodRequest.find(params[:id])
  end

  def send_details
    @request = BloodRequest.find(params[:id])

    message = "Your blood request has been accepted! Contact: #{params[:mobile]}, Location: #{params[:location]}"

    BloodRequestMailer.notify_requester(@request.user, message).deliver_now

    @request.update(accepted: true)

    redirect_to root_path, notice: "Details sent to the requester!"
  end



  private

  def blood_request_params
    params.require(:blood_request).permit(:name, :blood_group, :location)
  end
end
