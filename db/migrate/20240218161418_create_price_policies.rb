class CreatePricePolicies < ActiveRecord::Migration[7.1]
  def change
    create_table :price_policies do |t|
      t.string :name
      t.float :hourly_rate
      t.float :daily_rate
      t.datetime :valid_from
      t.datetime :valid_until
      t.boolean :is_active

      t.timestamps
    end
  end
end
