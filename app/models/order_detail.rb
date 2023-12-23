class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def add_tax_price
    (self.price * 1.10).round
  end

  def subtotal
    self.item.add_tax_price * self.amount
  end

# 0:製作不可, 1:製作待ち, 2:製作中, 3:製作完了
  enum making_status:{ start_not_possible: 0, making_pending: 1, in_making:2, making_complete: 3 }

end
