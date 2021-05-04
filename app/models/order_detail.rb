class OrderDetail < ApplicationRecord
  enum making_status:{
    "着手不可": 0, #製造不可
    "製造待ち": 1, #製造待ち
    "製作中": 2, #製作中
    "制作完了": 3, #製作完了
  }

  belongs_to :item
  belongs_to :order
end
