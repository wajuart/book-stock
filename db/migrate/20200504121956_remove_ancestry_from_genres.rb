class RemoveAncestryFromGenres < ActiveRecord::Migration[5.0]
  def change
    remove_column :genres, :ancestry, :string
  end
end
