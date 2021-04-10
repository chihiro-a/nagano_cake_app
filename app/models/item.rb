class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :order_dedails
  has_many :cart_items
end
