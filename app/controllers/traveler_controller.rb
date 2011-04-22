class TravelerController < ApplicationController

  respond_to :html

  def index
    redirect_to(action: "new")
  end

  def new
    @traveler = Traveler.new
  end

  def create
    @traveler = Traveler.new(params[:traveler])

    if @traveler.save
      flash[:notice] = 'Welcome to Tripapalooza!!!'
    else
      flash[:error] = @traveler.errors
    end

    redirect_to :controller=> "landing", :action=> "index"

  end

end
