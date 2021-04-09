class OrderDetail < ApplicationRecord
  enum making_status:{
    cannnot_be_making: 0, #製造不可
    waiting: 1, #製造待ち
    making: 2, #製作中
    completed: 3, #製作完了
  }
end
