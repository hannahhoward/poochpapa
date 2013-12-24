# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Admin.create([
  { first_name: "Ben", last_name: "Lee"}
  ]).first
User.create([
  { email: 'bigb57@aol.com', password: 'beefcake', role: admin}
])
client = Client.create([
  { first_name: 'Hannah',
    last_name: 'Howard',
    street_address_1: '1615 S Wilton Pl.',
    city: 'Los Angeles',
    state: 'California',
    zip: '90019',
    phone_number: '818-312-3967',
    special_instructions: 'She leaves the gate unlocked'
  }
]).first

Pet.create([
  { name: 'Daisy',
    age: 6,
    animal_type: 'Dog',
    breed: 'Doxson',
    medical_history: "Came from the state fair",
    special_needs: "The Ball",
    instructions: "Throw the ball",
    client: client }
])
