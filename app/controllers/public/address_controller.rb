class Public::AddressController < ApplicationController
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

  private
  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end
end
