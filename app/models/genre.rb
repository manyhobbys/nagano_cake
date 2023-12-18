class Genre < ApplicationRecord

  has_many :items, dependent: :destroy

  varidates :name, presence: true, uniqueness: true
end
