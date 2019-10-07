class CreateControllers < ActiveRecord::Migration[5.2]
  def change
    create_table :controllers do |t|
      t.string :pages
      t.string :home

      t.timestamps
    end
  end
end
