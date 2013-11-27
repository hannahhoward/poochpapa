# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([
  { email: 'bigb57@aol.com', password: 'beefcake' }
])
Pet.create([
  { name: 'Daisy',
    age: 6,
    animal_type: 'Dog',
    breed: 'Doxson',
    medical_history: "Came from the state fair",
    special_needs: "The Ball",
    instructions: "Throw the ball" }
])