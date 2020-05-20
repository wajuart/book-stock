class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.bigint :user_id, null: false
      t.integer :book_id, null: false
      t.text :text, null: false

      t.timestamps
    end
  end
end
