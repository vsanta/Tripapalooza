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
      flash[:notice] = t(:traveler_registration_success)
    else
      flash[:error] = @traveler.errors
    end
    redirect_to :controller=> "landing", :action=> "index", :traveler => params[:traveler]

  end

  def checkin_show
  end

  def checkin
    if (Traveler.authenticate params[:traveler][:nick], params[:traveler][:password])
      render :text => "Usuario/senha correto"
    else
      flash[:error] = "Usuario ou senha incorretos"
      redirect_to :controller=> "traveler", :action=> "checkin_show", :traveler => params[:traveler]
    end

  end

end
