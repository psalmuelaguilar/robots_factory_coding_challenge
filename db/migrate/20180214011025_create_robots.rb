class CreateRobots < ActiveRecord::Migration[5.1]
  def change
    create_table :robots do |t|
      t.string :name
      t.string :statuses, array: true
      t.timestamps
    end
  end
end
