class CreateParkingLots < ActiveRecord::Migration[7.1]
  def change
    create_table :parking_lots do |t|
      t.string :name
      t.integer :capacity
      t.integer :available_spaces

      t.timestamps
    end
  end
end
