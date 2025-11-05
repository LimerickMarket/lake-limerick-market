class MenuItem < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true

  scope :available, -> { where(available: true) }
  scope :by_category, ->(category) { where(category: category) if category.present? }

  def available?
    available == true
  end

  def formatted_price
    "$#{'%.2f' % price}"
  end
end
