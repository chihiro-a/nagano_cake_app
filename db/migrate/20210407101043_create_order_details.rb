class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_id
      # 商品ID
      t.integer :order_id
      # 注文ID
      t.integer :amount
      # 数量
      t.integer :price
      # 購入時金額（税込）
      t.integer :making_status, default: 0
      # 製造ステータス

      t.timestamps
    end
  end
end
