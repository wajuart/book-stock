class AddTitleToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :title, :string
  end
end
