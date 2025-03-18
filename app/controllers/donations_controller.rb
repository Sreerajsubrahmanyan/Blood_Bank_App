class DonationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @donation = Donation.new
  end

  def create
    @donation = current_user.donations.build(donation_params)

    if @donation.save
      redirect_to root_path, notice: "Donation record added successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def search
    if params[:clear]
      redirect_to root_path and return
    end

    if params[:blood_group].blank? && params[:location].blank?
      @donors = []
    else
      @donors = Donation.all
      @donors = @donors.where(blood_group: params[:blood_group]) if params[:blood_group].present?
      @donors = @donors.where("location LIKE ?", "%#{params[:location]}%") if params[:location].present?
    end

    @requests = BloodRequest.where(accepted: false)
    render "home/index"
  end



  private

  def donation_params
    params.require(:donation).permit(:name, :age, :weight, :blood_group, :last_donation_date, :location)
  end
end
