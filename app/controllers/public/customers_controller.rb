class Public::CustomersController < ApplicationController
  def show
    @user = current_customer
  end

  def edit
  end

  def unsubscribe
  end

end
