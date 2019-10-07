class CreateGyroscopes < ActiveRecord::Migration[5.2]
  def change
    create_table :gyroscopes do |t|
      t.belongs_to :wearable_label
      t.decimal :x_value
      t.decimal :y_value
      t.decimal :z_value
      t.datetime :timest
    end
  end
end
