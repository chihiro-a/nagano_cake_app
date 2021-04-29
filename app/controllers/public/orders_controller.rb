class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!, [:new,:index,:show]

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def confirm
    @customer = current_customer
    @order = Order.new(order_params)
    @address = @customer.addresses
    # なんでここtでOrder.newしないといけない？？
    # order_paramsを追加したら支払い情報が確認画面に表示されるようになった！
    if params[:@r1] == "first"
      puts 0
      @order = Order.new(name:"#{@customer.last_name}#{@customer.first_name}", address: @customer.address, postal_code: @customer.postal_code)
    elsif params[:@r1] == "third"
      @order_number = params[:order][:name]
      @order_address = Address.find(@order_number)
      @order.address = @order_address.address
      @order.postal_code = @order_address.postal_code
      @order.name = @order_address.name
      # @order = Order.new(name:@address.name(params[:id]), address: @address.address(params[:id]), postal_code: @address.postal_code(params[:id]))

    else
      puts 1
      @order = Order.new(order_params)

      @order_number = params[:order][:name]
      @order_address = Address.find(@order_number)
      @order.address = @order_address.address
      @order.postal_code = @order_address.postal_code
      @order.name = @order_address.name
      # @order = Order.new(name:@address.name(params[:id]), address: @address.address(params[:id]), postal_code: @address.postal_code(params[:id]))
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

    current_customer.cart_items.destroy_all
    # カート内を空にする


    # order_detail = OrderDetail.new(order_id: @order.id, item_id: customer.cart_item.item_id, amount: customer.cart_item.amount)

    # どの段階でorderdetailを作成する？？コントローラは作ったけどURLはないし…
    redirect_to orders_thanks_path
  end

  def index
    @orders = current_customer.orders
    # @order_details = OrderDetail.where(order_id: "@orders_id")
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment_method)
  end
end
