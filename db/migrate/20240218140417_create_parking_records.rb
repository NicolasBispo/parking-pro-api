class CreateParkingRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :parking_records do |t|
      t.datetime :entry_date
      t.datetime :left_date

      t.timestamps
    end
  end
end
