class AddImpressionToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :impression, :text
  end
end
