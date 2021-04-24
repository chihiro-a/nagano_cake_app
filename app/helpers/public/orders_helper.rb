module Public::OrdersHelper
  def number_to_currency(price)
    "#{customer.cart_items.item.price.to_s(:delimited)}"
  end
end
