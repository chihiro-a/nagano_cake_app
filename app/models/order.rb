class Order < ApplicationRecord
  enum payment_method:{
    "クレジットカード": 0, #クレジットカード
    "銀行振り込み": 1, #銀行振り込み
  }

  enum status:{
    "入金待ち": 0, #入金待ち
    "入金確認": 1, #入金確認
    "製作中": 2, #製作中
    "発送準備中": 3, #発送準備中
    "発送済み": 4, #発送済み
  }, _prefix: true

  belongs_to :customer
  has_many :order_details
end
