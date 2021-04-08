class Admin::HomesController < ApplicationController
  def index
    @orders = OrderDetail.all
  end
end
