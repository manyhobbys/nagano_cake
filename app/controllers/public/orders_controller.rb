class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.add_tax_price
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to thanks_orders_path
  end

  def index
    @orders = current_customer.orders.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_details.all
    @order_details = @order.order_details.all
    @total_item_amount = @order_details.sum { |order_detail| order_detail.subtotal }
    @order = Order.find(params[:id])
  end

  def confirm

    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.customer_id = current_customer.id
    @total = 0
    @order.shipping_cost = 800
    @order.total_payment = params[:order][:payment_method].to_i

    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      render 'new'
    end
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
