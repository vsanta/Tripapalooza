class LandingController < ApplicationController
  def index
    @traveler =  Traveler.new(params[:traveler]) if params[:traveler]
    render :action=>"index"
  end

end
