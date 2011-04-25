class Traveler < ActiveRecord::Base

  #attr_accessor :password
  def password
    @password
  end

  before_validation :format_fields

  validates_presence_of :nick, :email, message: :blank
  validates_uniqueness_of :nick
  validates_length_of :nick, maximum: 20, allow_nil: true, allow_blank: true
  validates_format_of :nick, without: / /, message: :blank

  validates_uniqueness_of :email
  validates_format_of :email, with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, allow_blank: true, allow_nil: true
  validates_length_of :email, maximum: 50, allow_nil: true, allow_blank: true

  validates_presence_of :password, message: :blank
  validates_length_of :password, minimum: 6, maximum: 20, allow_nil: true, allow_blank: true
  validates_format_of :password, without: / /, message: :blank_space

  validates_presence_of :hashed_password, message: :blank

  def self.authenticate(nick, submitted_password)
    traveler = self.find_by_nick(nick)
    return nil if traveler.nil?
    return traveler if traveler.password_match?(submitted_password, traveler.salt)
  end

  def password_match?(submitted_password, salt)
    self.hashed_password == Traveler.encrypt(submitted_password, salt)
  end

  def self.random_string(len)
   #generate a random password consisting of strings and digits
   chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
   newpass = ""
   1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
   return newpass
  end

  def password=(pass='')
    self.hashed_password = nil
    @password=pass
    if (!@password.nil? and @password.length > 0)
      self.salt = Traveler.random_string(10) if !self.salt?
      self.hashed_password = Traveler.encrypt(@password, self.salt)
    end
  end

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass+salt)
  end

private
  def format_fields
    self.nick.downcase! if self.nick != nil
    self.email.downcase! if self.email != nil
  end


end
