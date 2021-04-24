class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @customer = current_customer
    @order = Order.new(order_params)
    # なんでここtでOrder.newしないといけない？？
    # order_paramsを追加したら支払い情報が確認画面に表示されるようになった！
    if params[:@r1] == "first"
      puts 0
      @order = Order.new(name:"#{@customer.last_name}#{@customer.first_name}", address: @customer.address, postal_code: @customer.postal_code)
    else
      puts 1
      @order = Order.new(order_params)
    end
  end

  def create
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @order.customer_id = current_customer.id
    @order.save

    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.price
      @order_detail.order_id = @order.id
      @order_detail.save
    end


    # order_detail = OrderDetail.new(order_id: @order.id, item_id: customer.cart_item.item_id, amount: customer.cart_item.amount)

    # どの段階でorderdetailを作成する？？コントローラは作ったけどURLはないし…
    redirect_to orders_thanks_path
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment_method)
  end

  def order_details_params
    params.require(:order_detail).permit(:item_id, :amount, :price)
  end
end
