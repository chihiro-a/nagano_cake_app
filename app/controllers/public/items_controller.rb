class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(8)
    @count = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @price = (@item.price*1.1).round
    # tax_included_price = @item.price + tax
    # jpy_comma = tax_included_price.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')
    # @price = jpy_comma.to_i
    @cart_item = CartItem.new
  end



end
