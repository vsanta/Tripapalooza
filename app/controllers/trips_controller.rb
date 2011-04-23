class TripsController < ApplicationController
  include GoogleMapsHelper
  include GeocoderHelper
  # GET /trips
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  def show
    @trip = Trip.find(params[:id])
  end

  # GET /trips/new
  def new
    if params.has_key?(:trip)
      @trip = Trip.new(params[:trip])
    else
      @trip = Trip.new  
    end
    @map = map_init
    @map.markers << get_my_current_location_marker

  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  def create
    @trip = Trip.new(params[:trip])

      if @trip.save
        return redirect_to(@trip, :notice => 'Trip was successfully created.')
      end
      flash[:error] = @trip.errors
      redirect_to :action=>"new", :trip=>params[:trip]

  end

  # PUT /trips/1
  def update
    @trip = Trip.find(params[:id])

      if @trip.update_attributes(params[:trip])
        return redirect_to(@trip, :notice => 'Trip was successfully updated.')
      end
      render :action => "edit"

  end

  # DELETE /trips/1
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    redirect_to(trips_url)
  end
end
