class Address < ApplicationRecord
  belongs_to :customer
  def address_union
    "〒" + self.postal_code + "  " + self.address + " " + self.name
  end
end
