module ApplicationHelper

  def autotab
    @current_tab ||=0
    @current_tab +=1
  end

  def error
    'error' if !flash[:error].nil?
  end

  def error_message_on(field)
    flash[:error][field][0] if !flash[:error].nil? and !flash[:error][field].nil?
  end

  def error_for(field)
    'error' if !flash[:error].nil? and !flash[:error][field].nil? and !flash[:error][field].empty?
  end
end

module GoogleMapsHelper
  def map_init(zoom=nil)
    @map=Cartographer::Gmap.new('map')
    zoom ||=10
    @map.zoom = zoom
    @map.icons << Cartographer::Gicon.new
    @map
  end
end

module GeocoderHelper
  require 'geocoder'

  def get_my_current_location
    city = _get_city
    country = _get_country
    results = Geocoder.search("#{city}, #{country}")
    _get_coords(results)
  end
  def  get_my_current_location_marker
    coord = get_my_current_location
    @map.center = coord
    Cartographer::Gmarker.new(:position => coord)
  end

  private
  def _get_coords(result)
    if result
      return result[0].coordinates
    end
    return nil
  end
  def _get_city
    city = request.location.city
    city ="New York" if city.empty?
    city
  end

  def _get_country
    country = request.location.country_code
    country = "USA" if country.empty? or country=="RD"
    country
  end
end