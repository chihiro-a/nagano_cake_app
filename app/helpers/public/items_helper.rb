module Public::ItemsHelper
  def number_to_currency(price)
    "#{price.to_s(:delimited)}"
  end
end
