class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def add_tax_price
    (self.price * 1.10).round
  end

  def subtotal
    self.item.add_tax_price * self.amount
  end

end
