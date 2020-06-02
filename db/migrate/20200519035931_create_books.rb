class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.bigint :user_id, null: false
      t.string :title, null: false
      t.string :image
      t.string :author
      t.string :publisher
      t.integer :status, null: false
      t.integer :genre, null: false
      t.integer :item
      t.text :memo
      t.text :impression
      t.string :evaluation
      t.date :buy_date

      t.timestamps
    end
  end
end
