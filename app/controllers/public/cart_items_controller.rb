class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @cart_item = CartItem.new
  end

  def index
    @cart_items = current_customer.cart_items.includes(:item)
    @total = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all

    # ダブりを調べる
    double_cart_item = @cart_items.find_by(item_id: @cart_item.item_id)
    # 存在する場合は更新処理
    if double_cart_item
      # byebug
      double_cart_item.update(amount: double_cart_item.amount + @cart_item.amount)
      redirect_to cart_items_path
    else
      if @cart_item.save
        redirect_to cart_items_path
      else
        render 'index'
      end
    end
  end

  def edit
    @cart_item = CartItem.find(params[:id])
  end

  def update
    cart_item = current_customer.cart_items.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
