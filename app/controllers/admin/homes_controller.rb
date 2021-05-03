class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, only: [:index]
  # ログインしていない場合アクセス不可
  def index
    @orders = Order.all
    # order.id = order_detail.order_id
    # @order = Order.where(order.id)
  end
end
