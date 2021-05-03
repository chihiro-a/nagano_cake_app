class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!, only: [:index,:show,:edit,:order]
  # ログインしていない場合アクセス不可

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  def order
    @order = Order.find(params[:id])
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :telephone_number, :address, :is_active, :email)
  end

end
