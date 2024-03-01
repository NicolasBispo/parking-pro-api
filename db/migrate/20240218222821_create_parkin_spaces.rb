class CreateParkinSpaces < ActiveRecord::Migration[7.1]
  def change
    create_table :parking_spaces do |t|
      t.string :name
      t.float :width
      t.float :height

      t.timestamps
    end
  end
end
