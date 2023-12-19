class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create

  end

  def index
    @orders = current_customer.orders.all.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Adress.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      render 'new'
    end
    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id
    @total = 0
  end

  def thanks
  end

  private
  #ストロングパラメータ
  #require=>送られてきたデータの中からモデル名（:order）を指定し、データを絞り込む。
  #permit=>上記で絞り込んだデータの中から、保存を許可するカラムを指定（:name :address...etc）
  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment_method, :total_payment, :shipping_cost)
  end

end
