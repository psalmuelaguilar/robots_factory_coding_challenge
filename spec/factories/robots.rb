require 'faker'

FactoryBot.define do
  factory :robot do
    name Faker::StarWars.droid
    statuses ['loose_screw', 'paint_scratched', 'rusty', 'on_fire']
  end
end
