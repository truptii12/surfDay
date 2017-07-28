class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :dt
      t.decimal :pressure
      t.decimal :humidity
      t.decimal :speed
      t.integer :deg
      t.integer :clouds
      t.decimal :rain

      t.timestamps null: false
    end
  end
end
