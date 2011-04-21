class TravelerController < ApplicationController

  respond_to :html

  def index
    redirect_to(action: "new")
  end

  def new
  end

  def create
    @traveler = Traveler.new(params[:traveler])

    respond_to do |format|
      if @traveler.save
        flash[:notice] = 'Welcome to Tripapalooza!!!'
        format.html { redirect_to(:action => "new") }
      else
        format.html { render :action => "new" }
      end
    end
  end

end
