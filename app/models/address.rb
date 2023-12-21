class Address < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true

  def postal_code_and_address_and_name
    "〒#{self.postal_code} #{self.address}\n#{self.name}"
  end

end
