class Event < ApplicationRecord
  has_one_attached :image

  scope :upcoming, -> { where('event_date >= ?', Date.current).order(:event_date) }
  scope :past, -> { where('event_date < ?', Date.current).order(event_date: :desc) }

  validates :title, presence: true
  validates :event_date, presence: true
  validates :description, presence: true

  def upcoming?
    event_date >= Date.current
  end

  def past?
    !upcoming?
  end
end
