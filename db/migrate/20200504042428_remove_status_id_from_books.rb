class RemoveStatusIdFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :status_id, :integer
  end
end
