class CreateCoffees < ActiveRecord::Migration[5.2]
  def change
    create_table :coffees do |t|
      t.string :name
      t.string :origin
      t.string :notes
      t.string :img
      t.integer :price

      t.timestamps
    end
  end
end
