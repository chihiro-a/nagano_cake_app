class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!, [:index]
  # ログインしていない場合アクセス不可
  def index
  end
end
