class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_status = @order.status
    @order_details = OrderDetail.where(order_id: @order.id)
    
  end

  def update
    order = Order.find(params[:id])
    order.status = params[:order][:status]
    if order.status == "payment_confirmation"
      order.order_details.each do |detail|
        detail.update(making_status: 1)
      end
    end
    if order.update(order_params)
      redirect_to admin_order_path(order)
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :total_payment, :payment_method, :posal_code, :addrss, :status)
  end

end
