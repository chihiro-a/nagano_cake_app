class Order < ApplicationRecord
  emun payment_method:{
    credit: 0, #クレジットカード
    bank: 1, #銀行振り込み
  }

  emum status:{
    waiting: 0, #入金待ち
    payment_confirmed: 1, #入金確認
    create: 2, #製作中
    ready_to_ship: 3, #発送準備中
    sent: 4, #発送済み
  }
end
