class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :sku
      t.boolean :is_seasonal
      t.string :image
      t.string :quantity
      t.string :category

      t.timestamps
    end
  end
end
