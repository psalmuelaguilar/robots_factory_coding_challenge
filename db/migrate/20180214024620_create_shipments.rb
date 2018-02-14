class CreateShipments < ActiveRecord::Migration[5.1]
  def change
    create_table :shipments do |t|
      t.integer :robot_id
      t.timestamps
    end
  end
end
