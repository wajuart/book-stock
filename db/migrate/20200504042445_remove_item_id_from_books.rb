class RemoveItemIdFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :item_id, :integer
  end
end
