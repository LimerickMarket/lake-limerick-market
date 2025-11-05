class NewsletterTemplate < ApplicationRecord
  TEMPLATE_TYPES = {
    'weekly_deals' => 'Weekly Deals & Promotions',
    'event_notifications' => 'Event Notifications'
  }.freeze
  
  CADENCES = {
    'weekly' => 'Weekly',
    'biweekly' => 'Every 2 Weeks',
    'monthly' => 'Monthly',
    'quarterly' => 'Quarterly',
    'yearly' => 'Yearly',
    'manual' => 'Manual Send Only'
  }.freeze

  validates :name, presence: true
  validates :template_type, presence: true, inclusion: { in: TEMPLATE_TYPES.keys }
  validates :subject, presence: true
  validates :body, presence: true
  validates :cadence, presence: true, inclusion: { in: CADENCES.keys }
  
  scope :active, -> { where(active: true) }
  scope :weekly_deals, -> { where(template_type: 'weekly_deals') }
  scope :event_notifications, -> { where(template_type: 'event_notifications') }
  
  def template_type_name
    TEMPLATE_TYPES[template_type]
  end
  
  def cadence_name
    CADENCES[cadence]
  end
  
  def ready_to_send?
    return false unless active?
    return true if last_sent_at.nil?
    return true if cadence == 'manual'
    
    case cadence
    when 'weekly'
      last_sent_at < 1.week.ago
    when 'biweekly'
      last_sent_at < 2.weeks.ago
    when 'monthly'
      last_sent_at < 1.month.ago
    when 'quarterly'
      last_sent_at < 3.months.ago
    when 'yearly'
      last_sent_at < 1.year.ago
    else
      false
    end
  end
end
