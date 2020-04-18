class AddItemToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :item, :string
  end
end
