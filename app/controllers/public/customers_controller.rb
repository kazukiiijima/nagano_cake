class Public::CustomersController < ApplicationController

	before_action :authenticate_customer!

	def show
		@customer = current_customer
	end

	def edit
		@customer = current_customer
	end

	def update
		@customer = current_customer
		@customer.update(customer_params)
		redirect_to customer_path

	end

	def destroy
		@customer = current_customer
		@customer.update(is_deleted: true)
		reset_session
		redirect_to root_path
	end

	private

	def customer_params
		params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
	end

end
