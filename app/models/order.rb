class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  enum payment_method: { credit_card: 0, transfer: 1}
  enum status: {wait_for_payment: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
end
