# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
  description: 'appartement dans paris cherche jeune fille calme',
  deal: '3 soirs de libres par semaine + marché dimanche',
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
  detailed_description: "Je suis Jeanne, et j'adore jouer au Scrabble!",
  short_description: "Looking for a Scrabble Partner"
)

appart2 = Apartment.create!(
  user: u2,
  name: 'Big beedroom in Paris',
  description: 'Looking for someone to live with me in Paris, next to Champ de Mars',
  deal: '2 scrabble par semaine',
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
