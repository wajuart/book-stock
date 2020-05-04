class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :image, null: false
      t.string :title, null: false
      t.string :author, null: false
      # 以下3点 remove処理済み
      # t.string :status, null: false
      # t.string :genre, null: false
      # t.string :item, null: false
      t.string :buydate
      t.string :impression
      t.references :user, null: false
      t.references :genre, null: false
      t.references :status, null: false
      t.references :item, null: false
      t.timestamps
    end
  end
end
