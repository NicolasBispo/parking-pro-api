class CreateVehicleDescriptors < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicle_descriptors do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
