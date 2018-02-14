class Robot < ApplicationRecord
  STATUSES = ['on_fire', 'rusty', 'loose_screw', 'paint_scratched']
  has_one :configuration
end
