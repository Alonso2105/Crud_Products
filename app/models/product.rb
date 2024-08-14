class Product < ApplicationRecord
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end
  validates :name, presence: true
  validates :price, presence: true
  validates :sku, presence: true
  validates :sku, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, length: { maximum: 100 }
  validates :is_seasonal, inclusion: { in: [true, false] }
end
