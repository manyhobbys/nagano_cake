class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item(@item.id)
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_paramas)
       redirect_to admin_item_path(@item.id)
    else
      render :edit
  end

  private

  def item_params
    params.requier(:item).permit(:name, :introduction, :price, :is_active)
  end
end
