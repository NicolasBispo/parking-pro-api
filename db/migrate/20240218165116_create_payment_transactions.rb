class CreatePaymentTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_transactions do |t|
      t.float :value
      t.string :payment_method
      t.datetime :payment_date

      t.timestamps
    end
  end
end
