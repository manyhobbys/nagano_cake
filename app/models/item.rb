class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_many :orders, through: :order_details

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    # image.variant(resize_to_limit: [width, height]).processed
    image.variant(gravity: :center, resize:"#{width}x#{height}^", crop:"#{width}x#{height}+0+0").processed
  end

  def add_tax_price
    (self.price * 1.10).round
  end

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
end
