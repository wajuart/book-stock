class RemoveUserIdFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :user_id, :bigint
  end
end
