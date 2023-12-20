class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def subtotal
    self.item.including_tax_price * self.amount
  end

end
