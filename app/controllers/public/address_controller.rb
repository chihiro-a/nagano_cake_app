class Public::AddressController < ApplicationController

  before_action :authenticate_customer!, only: [:index,:edit]
  # ログインしていない場合アクセス不可

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to address_path
    # 一覧へリダイレクト
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to address_path
    # 一覧へリダイレクト
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to address_path
  end

  private
  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end
end
