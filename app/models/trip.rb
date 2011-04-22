class Trip < ActiveRecord::Base
  validate :start_date_is_before_end_date

  validates_presence_of :name, :destination, :destination_lat, :destination_lon



  def start_date_is_before_end_date
    self.start > self.end
  end
end
