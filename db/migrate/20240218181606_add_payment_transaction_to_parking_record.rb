class AddPaymentTransactionToParkingRecord < ActiveRecord::Migration[7.1]
  def change
    add_reference :parking_records, :payment_transaction, null: false, foreign_key: true
  end
end
