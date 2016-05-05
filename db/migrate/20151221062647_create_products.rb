class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :b_name
      t.string :details
      t.string :price

      t.timestamps null: false
    end
  end
end
