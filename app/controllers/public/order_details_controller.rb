class Public::OrderDetailsController < ApplicationController
    def create
        @order_detail = OrderDetail.new(order_detail_path)
    end
    
    private
    def order_detail_path
        params.require(:order_detail).permit(:item_id, :orde_id, :postal_code, :shipping_cost)
    end
end
