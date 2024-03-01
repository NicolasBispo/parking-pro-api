class AddVehicleToParkingRecord < ActiveRecord::Migration[7.1]
  def change
    add_reference :parking_records, :vehicle, null: false, foreign_key: true
  end
end
