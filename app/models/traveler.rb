class Traveler < ActiveRecord::Base

  before_validation :format_fields

  validates_presence_of :nick, :email, :password, message: " - must be informed"

  validates_uniqueness_of :nick, message: " - this nick is already taken"
  validates_length_of :nick, minimum: 3 , maximum: 20, allow_nil: true, allow_blank: true,  message: " - should be more than 2 and less than 20 characters"
  validates_format_of :nick, without: / /, message: " - cannot contain white space"

  validates_uniqueness_of :email, message: " - this e-mail is already being used"
  validates_format_of :email, with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, allow_blank: true, allow_nil: true, message: " - Its not a valid format"
  validates_length_of :email, maximum: 50, allow_nil: true, allow_blank: true, message: " - should be less than 50 characters"

  validates_length_of :password, minimum: 6, maximum: 20, allow_nil: true, allow_blank: true, message: "- should have 6 characters or more"
  validates_format_of :password, without: / /, message: " - cannot contain white space"

  def format_fields
    self.nick.downcase! if self.nick != nil
    self.email.downcase! if self.email != nil
  end
end
