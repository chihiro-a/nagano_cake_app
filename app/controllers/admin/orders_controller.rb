class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!, only: [:index,:update]
  # ログインしていない場合アクセス不可
  def index
  end
  def update
    @order = Order.find(params[:id])
    @order.status = params[:order][:status]
    @order.save
    redirect_to admin_order_path
  end
  def making_status_update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.making_status = params[:order_detail][:making_status]
    @order_detail.save
    redirect_to admin_order_path(@order_detail.order)
  end
end
