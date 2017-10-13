# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.destroy_all
Booking.destroy_all
Conversation.destroy_all
ApartmentAmenity.destroy_all
Amenity.destroy_all
ProfileCharacteristic.destroy_all
Characteristic.destroy_all
Apartment.destroy_all
Profile.destroy_all
User.destroy_all

u1 = User.create!(
  email: "elise1950@edhec.edu",
  password: "password"
)

profile1 = Profile.create!(
  user: u1,
  profile_type: "host",
  username: "mamieedhec",
  first_name: "Elise",
  last_name: "Francois",
  age: 88,
  city_from: "Paris",
  gender: "female",
  phone_number: '0600300040',
  country_from: "France",
  detailed_description: "My name is Elise and I love to hang out with young fellows",
  short_description: "Young at heart! "
)

appart1 = Apartment.create!(
  user: u1,
  name: 'sunny beedroom in Paris',
  description: 'Apartment in Paris, looking for someone fairly calm',
  deal: '3 evenings a week + the market on Sunday',
  street: 'rue Freycinet',
  city: 'Paris',
  zip_code: 75116,
  country: 'France',
  bedrooms: 1,
  bathrooms: 1,
  street2: 'rdc',
  latitude: 48.8657932,
  longitude: 2.297879,
)

bedroom = ["Bed", "Desk", "Bedside table", "Bedside Lamp", "Pillow", "Comforter", "Window", "Air conditioning", "Heating", "Dresser"]
bathroom = ["Bath tub", "Shower", "Mirror", "Hair dryer", "Towels", "Towels rack"]
kitchen = ["Electric hobs", "Gas hobs", "Oven", "Microwave", "Coffee machine", 'Dishwasher']
other = ["Iron/Iron Board", "Wifi", 'Washing Machine', 'Drier', 'Swimming Pool', 'Jacuzzi', 'Garden']
livingroom = ["TV", "Sofa", "Fireplace", "Plasma TV", "Video Games Console"]

livingroom.each do | amenity |
  Amenity.create!(category: "livingroom", name: amenity, item_slug: "Living Room")
end

bedroom.each do | amenity |
  Amenity.create!(category: "bedroom", name: amenity, item_slug: "Bedroom")
end

bathroom.each do | amenity |
  Amenity.create!(category: "bathroom", name: amenity, item_slug: "Bathroom")
end

kitchen.each do | amenity |
  Amenity.create!(category: "kitchen", name: amenity, item_slug: "Kitchen")
end

other.each do | amenity |
  Amenity.create!(category: "other", name: amenity, item_slug: "Other")
end

characteristics = ["Accessible","Active", "Adaptable", "Balanced", "Benevolent", "Calm", "Caring", "Challenging",
 "Charismatic", "Charming", "Cheerful", "Clean", "Clear-headed", "Decisive", "Dedicated",
 "Disciplined", "Discreet", "Educated", "Efficient", "Fair", "Faithful",
 "Gentle", "Genuine", "Hearty", "Helpful", "Imaginative", "Kind", "Lovable",
 "Loyal", "Methodical", "Meticulous", "Open", "Optimistic", "Peaceful", "Perceptive",
 "Sharing", "Tolerant", "Warm"]

characteristics.each do |characteristic|
  Characteristic.create!(name: characteristic)
end

u2 = User.create!(
  email: "jeanne45@edhec.edu",
  password: "password"
)

profile2 = Profile.create!(
  user: u2,
  profile_type: "host",
  username: "jeanne45",
  first_name: "Jeanne",
  last_name: "Dupont",
  age: 88,
  city_from: "Paris",
  gender: "female",
  phone_number: '0610203040',
  country_from: "France",
  detailed_description: "I am Jeanne, I have 2 kids and used to have an incredible husband. I also have a cat! Fun fact, I love playing Scrabble! ",
  short_description: "Looking for a Scrabble Partner"
)

appart2 = Apartment.create!(
  user: u2,
  name: 'Big beedroom in Paris',
  description: 'Looking for someone to live with me in Paris, next to Champ de Mars',
  deal: '2 Scrabbles a week',
  street: '2 Allée Adrienne Lecouvreur',
  city: 'Paris',
  zip_code: 75007,
  country: 'France',
  bedrooms: 1,
  bathrooms: 1,
  latitude: 48.8539424,
  longitude: 2.3036154,
)

u3 = User.create!(
  email: "toto@edhec.com",
  password: "password"
)

profile3 = Profile.create!(user: u3,
  profile_type: "student",
  username: "totolebon",
  first_name: "toto",
  last_name: "lebon",
  age: 23,
  city_from: "Melbourne",
  country_from: "Australia",
  gender: "male",
  phone_number: '0610807050',
  detailed_description: "My name is Toto, Inlive in Melbourne and want to travel the world! ",
  short_description: "Looking for an apartment in France!"
)

u4 = User.create!(
  email: "alice@edhec.com",
  password: "password"
)

profile4 = Profile.create!(user: u4,
  profile_type: "student",
  username: "alicewashington",
  first_name: "alice",
  last_name: "washington",
  age: 21,
  city_from: "Blacksburg",
  country_from: "United States",
  gender: "female",
  phone_number: '5403851539',
  detailed_description: "I am Alice from Blacksburg, VA (USA) and looking to live in Europe for a semester ",
  short_description: "Looking for an apartment in Europe!"
)

u5 = User.create!(
  email: "audrey82@edhec.edu",
  password: "password"
)

profile5 = Profile.create!(
  user: u5,
  profile_type: "host",
  username: "audrey82",
  first_name: "Audrey",
  last_name: "Dupont",
  age: 82,
  city_from: "Lyon",
  gender: "female",
  phone_number: '0604300040',
  country_from: "France",
  detailed_description: "I am Audrey, and I have been feeling a little lonely since my husband passed. I'd love to take in someone with me and we couldlive with my 3 cats which I adore!",
  short_description: "Cat lover "
)

appart5 = Apartment.create!(
  user: u5,
  name: 'Cosy house in Lyon',
  description: 'Small house in Lyon, looking for someone to keep me company!',
  deal: 'Just be nice and respectful to me and my pets',
  street: '41 quai Pierre Scize',
  city: 'Lyon',
  zip_code: 69009,
  country: 'France',
  bedrooms: 2,
  bathrooms: 1,
  street2: 'rdc',
)

u6 = User.create!(
  email: "marie20@edhec.com",
  password: "password"
)

profile6 = Profile.create!(user: u6,
  profile_type: "student",
  username: "marie20",
  first_name: "Marie",
  last_name: "Puits",
  age: 21,
  city_from: "Marseille",
  country_from: "France",
  gender: "female",
  phone_number: '0610817050',
  detailed_description: "I am Marie, I am a law student from Marseille, and I'm trying to find a cheap way to move to Paris to pursue my law degree. I'm a very nice and patient person! ",
  short_description: "Looking to move to Paris!"
)

u7 = User.create!(
  email: "eddie@edhec.edu",
  password: "password"
)

profile7 = Profile.create!(
  user: u7,
  profile_type: "host",
  username: "eddie-de-mars",
  first_name: "Edouard",
  last_name: "Sand",
  age: 66,
  city_from: "Marseille",
  gender: "Male",
  phone_number: '0604311040',
  country_from: "France",
  detailed_description: "I am Eddie, from Marseille, and I want to welcome someone to my house near the beach. Let's have some fun!",
  short_description: "Beach lover"
)

appart7 = Apartment.create!(
  user: u7,
  name: 'Beach house in Marseille',
  description: 'Nice beach house in Marseille, weather is great all year around',
  deal: '3 half and hour long walks per week with me',
  street: '4 rue des Catalans',
  city: 'Marseille',
  zip_code: 13007,
  country: 'France',
  bedrooms: 3,
  bathrooms: 2,
)

u8 = User.create!(
  email: "matt1996@edhec.com",
  password: "password"
)

profile8 = Profile.create!(user: u8,
  profile_type: "student",
  username: "matt96",
  first_name: "Mathieu",
  last_name: "Olivier",
  age: 21,
  city_from: "Rome",
  country_from: "Italy",
  gender: "Male",
  phone_number: '0610817890',
  detailed_description: "I am Matt, from Rome (Italy) and I want to travel the world but don't have much money. I would love to study in France!",
  short_description: "I want to learn French!"
)

u9 = User.create!(
  email: "marc@edhec.edu",
  password: "password"
)

profile9 = Profile.create!(
  user: u9,
  profile_type: "host",
  username: "marc-1947",
  first_name: "Marc",
  last_name: "Pois",
  age: 70,
  city_from: "Toulouse",
  gender: "Male",
  phone_number: '0685311040',
  country_from: "France",
  detailed_description: "I am Marc and I live in Toulouse. My kids live abroad so I don't have people coming to see me often, thus I'd love some company!",
  short_description: "Come play Bingo with me!"
)

appart9 = Apartment.create!(
  user: u9,
  name: 'Big apartment in Toulouse',
  description: 'Very big apartment, I used to have 3 kids living there!',
  deal: '3 half and hour long walks per week with me',
  street: "14 Rue de l'Aubépine",
  city: 'Toulouse',
  zip_code: 13007,
  country: 'France',
  bedrooms: 4,
  bathrooms: 2,
)


booking1 = Booking.create!(
  start_date: Date.parse('2017-11-18'),
  end_date: Date.parse('2017-11-25'),
  status: "pending",
  apartment: appart5,
  user: u4,
)

booking2 = Booking.create!(
  start_date: Date.parse('2017-12-12'),
  end_date: Date.parse('2017-12-28'),
  status: "approved",
  apartment: appart2,
  user: u6,
)

booking3 = Booking.create!(
  start_date: Date.parse('2017-12-12'),
  end_date: Date.parse('2017-12-20'),
  status: "denied",
  apartment: appart2,
  user: u3,
)
