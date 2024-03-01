class AddParkingLotToParkingRecord < ActiveRecord::Migration[7.1]
  def change
    add_reference :parking_records, :parking_lot, null: false, foreign_key: true
  end
end
