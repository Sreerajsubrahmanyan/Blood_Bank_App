class HomeController < ApplicationController
  def index
    @requests = BloodRequest.where(accepted: false)
  end
end
