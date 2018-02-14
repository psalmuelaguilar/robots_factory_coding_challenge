class CreateConfigurations < ActiveRecord::Migration[5.1]
  def change
    create_table :configurations do |t|
      t.boolean :has_sentience, default: false
      t.boolean :has_wheels, default: false
      t.boolean :has_tracks, default: false
      t.integer :number_of_rotors, default: 0
      t.integer :robot_id
      t.string :colour
      t.timestamps
    end
  end
end
