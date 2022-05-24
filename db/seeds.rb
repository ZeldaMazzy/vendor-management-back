# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

genders = [
  'Male',
  'Female',
  'Male',
  'Female',
  'Male',
  'Female',
  'Male',
  'Female',
  'Nonbinary'
]

races = [
  'White',
  'Black',
  'White',
  'Black',
  'White',
  'Black',
  'Hispanic / Latinx',
  'Hispanic / Latinx',
  'White',
  'Black',
  'White',
  'Black',
  'White',
  'Black',
  'Hispanic / Latinx',
  'Hispanic / Latinx',
  'East Asian',
  'South Asian',
  'Middle Eastern',
  'Pacific Islander',
  'First Nations'
]

(1..20).each do |n|
    Vendor.create(name: Faker::Name.name, age: Random.rand(10..60).floor(), gender: genders[Random.rand(8)], race: races[Random.rand(20)], phone: 1111111111, email: Faker::Internet.email, user_id: 1 )
end