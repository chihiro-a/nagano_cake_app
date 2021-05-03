class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!,only: [:index, :create]
  # ログインしていない場合アクセス不可
  def create
    cart_item = CartItem.new(cart_item_params)
    # 前のページから送られてきた情報をここで取得

    current_cart_item = current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])
    # 追加しようとしたアイテムが、今のカート内に入っているかどうかを判定する。
    # find_byだと該当する値がない場合もエラーにならない

    if current_cart_item
      # ↑で定義した変数。該当するのもがあればtrue、なければfalseが返る
      current_cart_item.amount += cart_item.amount
      # 既にカートに入っている数量　＋　新しく追加する数量
      current_cart_item.save
    else
      cart_item.customer_id = current_customer.id
      cart_item.save
    end
    redirect_to cart_items_path
    # カート内商品一覧へリダイレクト
  end

  def index
     @cart_items = current_customer.cart_items

    # 税込合計金額を出すための処理↓
    total_prices = 0
    @cart_items.each do |cart_item|
      item_price = cart_item.item.price
      amount = cart_item.amount
      total_prices += item_price * amount
    end
    @price = ((total_prices * 1.1).round).to_s(:delimited)
    # ここまで↑

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
