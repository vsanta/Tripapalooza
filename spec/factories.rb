# By using the symbol ':traveler', we get Factory Girl to simulate the Traveler model.
Factory.define :traveler do |traveler|
  traveler.nick     "belrodrigues"
  traveler.email    "bel@tripapalooza.net"
  traveler.password "rightpassword"
end