class AddVehicleToVehicleDescriptor < ActiveRecord::Migration[7.1]
  def change
    add_reference :vehicle_descriptors, :vehicle, null: false, foreign_key: true
  end
end
