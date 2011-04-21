class Traveler < ActiveRecord::Base

  validates_uniqueness_of :nick, message: " - this nick is already taken"
  validates_presence_of :nick, message: " - must be informed"
  validates_length_of :nick, minimum: 3 , maximum: 20, allow_nil: true, allow_blank: true,  message: " - should be more than 2 and less than 20"
  validates_format_of :nick, without: / /, message: " - cannot contain white space"
end
