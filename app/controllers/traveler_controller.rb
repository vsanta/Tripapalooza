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
    nick = params[:traveler][:nick]
    password = params[:traveler][:password]

    traveler = Traveler.find_by_nick nick

    if (traveler.authenticate nick, password)
      render :text => "Usuario/senha correto"
    else
      render :text => "Usuario ou senha incorreto"
    end

  end

end
