class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
    # カート内商品一覧へリダイレクト
  end

  def index
    # @cart_items = CartItem(current_cart_item.id)
    # どうやって今のカート内データのみ取得する？

  end

  def update
  end

  def reset
  end

  def destroy
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end


end
