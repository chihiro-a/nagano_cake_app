class CartItem < ApplicationRecord
  belongs_to :customer, dependent: :destroy
  belongs_to :item

end
