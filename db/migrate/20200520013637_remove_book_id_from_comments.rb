class RemoveBookIdFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :book_id, :integer
  end
end
