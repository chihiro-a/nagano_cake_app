class Public::CustomersController < ApplicationController
    def show
      @customer = current_customer
    end

    def edit
      @customer = Customer.find(current_customer.id)
    end

    def update
      @customer = Customer.find(current_customer.id)
      @customer.update(customer_params)
      redirect_to customers_path
      # ユーザ情報詳細へリダイレクト
    end

    def unsubscribe
      @customer = Customer.find(current_customer.id)
    end

    def withdraw
      # is_activeをfalseにする処理
      @customer = Customer.find(current_customer.id)
      @customer.update(customer_params)
      @customer.save
      redirect_to root_path
    end

    private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :telephone_number, :address, :is_active)
    end

end
