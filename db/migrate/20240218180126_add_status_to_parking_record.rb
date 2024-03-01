class AddStatusToParkingRecord < ActiveRecord::Migration[7.1]
  def change
    add_column :parking_records, :status, :string
  end
end
