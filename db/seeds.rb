# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
# unless Rails.env.development?
#   puts "Development seeds only (for now)!"
#   exit 0
# end

# Let's do this ...

## USERS

puts "Re-creating Users ..."

User.destroy_all

u1 = User.create!({
  name:  'Obama',
  email: '1@1.1',
  password_digest: '1111',
  photo: open_asset('Obama.jpg'),
  description: Faker::Hipster.paragraph(4),
  DoB: 50.years.from_now,
  phone_number: '+11111111111'
})

u2 = User.create!({
  name:  'Beyonce',
  email: '2@2.2',
  password_digest: '2222',
  photo: open_asset('beyonce.jpg'),
  description: Faker::Hipster.paragraph(4),
  DoB: 50.years.from_now,
  phone_number: '+12222222222'
})

u3 = User.create!({
  name:  'Peter',
  email: '3@3.3',
  password_digest: '3333',
  photo: open_asset('peter.jpg'),
  description: Faker::Hipster.paragraph(4),
  DoB: 50.years.from_now,
  phone_number: '+13333333333'
})

puts "DONE!"

# EVENTS

puts "Re-creating Events..."

Event.destroy_all

e1 = u1.events.create!({
  title: 'Scorn Trump',
  lat: 49.281049,
  lng: -123.107174,
  status: false,
  description: Faker::Hipster.paragraph(4),
  scheduled_at: 10.days.from_now
})

e2 = u2.events.create!({
  title: 'Buy a speaker',
  lat: 49.284557,
  lng: -123.10831,
  status: true,
  description: Faker::Hipster.paragraph(4),
  scheduled_at: 15.days.from_now
})

e3 = u3.events.create!({
  title: 'Invest another Facebook',
  lat: 49.28,
  lng: -123,
  status: false,
  description: Faker::Hipster.paragraph(4),
  scheduled_at: 15.days.from_now
})

puts "DONE!"

# HELPER_LIST

puts "Re-creating helper_list..."

HelperList.destroy_all

HelperList.create!({
  user: u1,
  event: e2
})

puts "DONE!"

# LOCATION

puts "Re-creating location..."

Location.destroy_all

Location.create!({
  user: u2,
  event: e2,
  startlat: 49.284557,
  startlng: -123.10831,
  endlat: 49.285,
  endlng: -123.111
})

puts "DONE"
