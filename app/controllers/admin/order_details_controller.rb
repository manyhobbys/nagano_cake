class Admin::OrderDetailsController < ApplicationController

  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.making_status = params[:order_detail][:making_status]
    order_details = OrderDetail.where(order_id: order_detail.order_id)
    if order_detail.making_status == "in_making"
      order_detail.order.update(status: 2)
    end
    if order_detail.update(order_detail_params)
      redirect_to admin_order_path
    end
    if order_details.all? { |detail| detail.making_status == "making_complete" }
      order_detail.order.update(status: 3)
    end
  end


  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
