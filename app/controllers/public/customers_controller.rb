class Public::CustomersController < ApplicationController
    def show
      @customer = Customer.find(current_customer.id)
    end

    def edit
      @customer = Customer.find(current_customer.id)
    end

    def update
      @customer = Customer.find(current_customer.id)
      @customer.update(customer_params)
      redirect_to public_customer_path(current_customer.id)
    end

    def unsubscribe
    end

    def withdraw
    end

    private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :telephone_number, :adress)
    end
end
