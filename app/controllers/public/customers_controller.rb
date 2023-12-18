class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer = update(customer_params)
    if @customer = save
      redirect_to  customers_my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

private
  def customer_params
    params.require(:customer).permit(:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number )
  end


end
