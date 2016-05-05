class AddColumnToImage < ActiveRecord::Migration
  def change
    add_column :images, :entity_id, :string
    add_column :images, :entity_type, :string
  end
end
