class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.integer :book_id, null: false, foreign_key: true
      t.text :text, null: false

      t.timestamps
    end
  end
end
