require 'faker'

FactoryBot.define do
  factory :configuration do
    has_sentience [true, false].sample
    has_wheels [true, false].sample
    has_tracks [true, false].sample
    number_of_rotors 3
    colour Faker::Color.color_name
  end
end
