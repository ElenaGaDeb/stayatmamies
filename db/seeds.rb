# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(
  email: "mamie@edhec.edu",
  password: "mamieedhec"
)
puts "user created"
p u1
profile1 = Profile.create!(user: u1,
  profile_type: "student",
  username: "totolebon",
  first_name: "toto",
  last_name: "lebon",
  age: 23,
  city_from: "Melbourne",
  gender: "male",
  detailed_description: "je m'appelle toto, j'habite à Melbourne et j'aime voyager",
  short_description: "Toto cherche appartement"
)

puts "profile created"
p profile1
appart1 = Apartment.create!(
  user: u1,
  name: 'sunny beedroom in Paris',
  description: 'appartement dans paris cherche jeune fille calme',
  deal: '3 soirs de libres par semaine + marché dimanche',
  street: 'rue Freycinet',
  city: 'Paris',
  zip_code: 75116,
  country: 'France',
  bedrooms: 1,
  bathrooms: 1,
  street2: 'rdc'
)

bedroom = ["Bed", "Desk", "Bedside table", "Table lamp", "Pillow", "Blanket" "Window", "Air conditioning" "Heating"]
bathroom = ["Bath tub", "Shower", "Mirror", "Hair dryer" "Towel"]
kitchen = ["Electric hobs", "Gas hobs", "Oven", "Microwave", "Coffee machine", 'Dishwasher']
other = ["iron/iron board" "Internet"]
["TV", "Sofa", "Fireplace"].each do | amentity |
  Amenity.new(category: "livingroom", name: amentity)
end

bedroom.each do | amentity |
  Amenity.new(category: "bedroom", name: amentity)
end

bathroom.each do | amentity |
  Amenity.new(category: "bathroom", name: amentity)
end

kitchen.each do | amentity |
  Amenity.new(category: "kitchen", name: amentity)
end

other.each do | amentity |
  Amenity.new(category: "other", name: amentity)
end






