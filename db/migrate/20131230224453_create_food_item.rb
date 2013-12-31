class CreateFoodItem < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.decimal :inventory, null: false, default: 0

      t.timestamps
    end
  end
end
