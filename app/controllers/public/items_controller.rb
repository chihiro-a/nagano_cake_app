class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    tax = @item.price*0.1
    tax_included_price = @item.price + tax
    jpy_comma = tax_included_price.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')
    @price = jpy_comma.to_i
    @cart_item = CartItem.new
  end


end
