class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :kind

      t.timestamps
    end
  end
end
