require 'rubygems'
require 'geocoder'

class Trip < ActiveRecord::Base
  after_validation :set_geolocation
  validates_presence_of :name, :destination,  :message => :blank
  validate :start_date_is_before_end_date

  def set_geolocation
    self.destination_lat, self.destination_lon =  Geocoder.coordinates(self.destination)
  end

  def start_date_is_before_end_date
    if self.start_date.nil? or self.end_date.nil?
      return
    end
    errors.add(:start_date, "Start date should not be after end date") if self.start_date > self.end_date
  end
end
