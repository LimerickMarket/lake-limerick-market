class Promo < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  scope :active, -> { where('start_date <= ? AND end_date >= ?', Date.current, Date.current) }
  scope :upcoming, -> { where('start_date > ?', Date.current) }
  scope :expired, -> { where('end_date < ?', Date.current) }

  def active?
    start_date <= Date.current && end_date >= Date.current
  end

  def expired?
    end_date < Date.current
  end

  def upcoming?
    start_date > Date.current
  end
end
