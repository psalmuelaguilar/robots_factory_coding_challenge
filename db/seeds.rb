# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Setting Robot and Configuration...'
1000.times do
  robot = Robot.create(
    name: Faker::StarWars.droid,
    statuses: Robot::STATUSES.sample(1 + rand(Robot::STATUSES.count))
  )

  Configuration.create(
    has_sentience: [true, false].sample,
    has_wheels: [true, false].sample,
    has_tracks: [true, false].sample,
    number_of_rotors: rand(10),
    robot_id: robot.id,
    colour: Faker::Color.color_name
  )
end
