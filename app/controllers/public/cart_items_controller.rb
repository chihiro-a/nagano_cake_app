class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
    # カート内商品一覧へリダイレクト
  end

  def index
    @cart_items = current_customer.cart_items
    # @order_ditails = OrderDetail.new
    # @item = Item.find(@cart_items.item_id)
    # @items = @cart_items.item
    # アソシエーションで情報を取得する！view内で情報を持ってくるようにする！
    # @cart_item = CartItem.find(params[:id])

  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
    # カート内商品一覧へリダイレクト
  end

  def reset
    # カート内商品全消去
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    # カート内一部商品削除
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
    # カート内商品一覧へリダイレクト
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end


end
