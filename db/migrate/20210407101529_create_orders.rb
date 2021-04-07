class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :adress
      t.string :name
      # 配送先氏名
      t.integer :shipping_cost
      # 送料
      t.integer :total_payment
      # 請求額
      t.integer :payment_method, default: 0
      # 支払い方法
      t.integer :status, default: 0
      # 注文ステータス

      t.timestamps
    end
  end
end
