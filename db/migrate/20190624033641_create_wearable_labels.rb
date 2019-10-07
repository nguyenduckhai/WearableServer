class CreateWearableLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :wearable_labels do |t|
      t.belongs_to :device
      t.belongs_to :activity
      t.timestamps 
      t.string :time_end
    end
  end
end
