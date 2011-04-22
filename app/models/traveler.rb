class Traveler < ActiveRecord::Base

  before_validation :format_fields

  validates_presence_of :nick, :email, :password, message: :blank


  validates_uniqueness_of :nick
  validates_length_of :nick, maximum: 20, allow_nil: true, allow_blank: true
  validates_format_of :nick, without: / /, message: :blank

  validates_uniqueness_of :email
  validates_format_of :email, with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, allow_blank: true, allow_nil: true
  validates_length_of :email, maximum: 50, allow_nil: true, allow_blank: true

  validates_length_of :password, minimum: 6, maximum: 20, allow_nil: true, allow_blank: true
  validates_format_of :password, without: / /, message: :blank_space

  def format_fields
    self.nick.downcase! if self.nick != nil
    self.email.downcase! if self.email != nil
  end
end
