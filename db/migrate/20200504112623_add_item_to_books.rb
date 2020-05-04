class AddItemToBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :item, foreign_key: true
  end
end
