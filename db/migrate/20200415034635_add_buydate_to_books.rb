class AddBuydateToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :buydate, :date
  end
end
