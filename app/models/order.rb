class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  with_options presence: do
    validates :payment_method
    validates :total_payment
    validates :shipping_cost
    validates :postal_code
    validates :address
    validates :name
    validates :status
  end

  enum payment_method: { credit_card: 0, transfer: 1}
  # 入金待ち0, 入金確認1, 製作中2, 発送準備中3, 発送済み4
  enum status: {wait_for_payment: 0, payment_confirmation: 1, in_making: 2, preparing_delivery: 3, delivered: 4}

  def postal_code_and_address_and_name
    "〒#{self.postal_code} #{self.address}\n#{self.name}"
  end

  def add_tax_price
    (self.price * 1.10).round
  end

  def subtotal # 小計
    self.add_tax_price * self.amount
  end

  def total_paymen_sum
    self.total_payment + self.shipping_cost
  end

  def total_item_amount #合計金額
   order_details.sum { |order_detail| order_detail.subtotal }
  end
  # ブロック変数 => 繰り返すときに使用。
  #order_detailsに紐づくすべてのアイテム合計金額を出したいのでブロック変数使用。
end
