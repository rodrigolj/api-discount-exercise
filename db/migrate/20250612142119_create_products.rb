class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 14, scale: 4

      t.timestamps
    end
    add_index :products, :name, unique: true
  end
end
