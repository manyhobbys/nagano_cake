class Public::HomesController < ApplicationController
  def top
    @items = Item.all.order(create_at: :desc)
  end

  def about
  end
end
