class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :main
      t.string :description
      t.string :icon

      t.timestamps null: false
    end
  end
end
