require 'rubygems'
require 'geocoder'

class Trip < ActiveRecord::Base
  after_validation :set_geolocation
  validate :start_date_is_before_end_date=> true, :message =>:start_before_end_date

  validates_presence_of :name, :destination, :destination_lat, :destination_lon, :message => :blank


  def set_geolocation
    self.destination_lat, self.destination_lon =  Geocoder.coordinates(self.destination)
  end

  def start_date_is_before_end_date
    self.start > self.end
  end
end
