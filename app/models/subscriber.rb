class Subscriber < ApplicationRecord
  before_create :set_subscribed_at

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true

  scope :wants_weekly_deals, -> { where(weekly_deals: true) }
  scope :wants_event_notifications, -> { where(event_notifications: true) }

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def set_subscribed_at
    self.subscribed_at ||= Time.current
  end
end
