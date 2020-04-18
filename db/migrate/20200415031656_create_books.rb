class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :status
      t.string :genre
      t.string :buydate
      t.string :image
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
