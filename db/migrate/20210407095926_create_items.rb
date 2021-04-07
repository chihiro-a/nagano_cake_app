class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      # 商品名
      t.string :image_id
      # 商品画像ID
      t.text :introduction
      t.integer :price
      # 税抜き価格
      t.boolean :is_active, default: true
      

      t.timestamps
    end
  end
end
