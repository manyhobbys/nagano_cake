class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
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
