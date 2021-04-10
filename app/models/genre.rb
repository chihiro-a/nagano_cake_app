class Genre < ApplicationRecord
  enum name:{
    cake: 0, #ケーキ
    pudding: 1, #プリン
  }
  has_many :items
end
