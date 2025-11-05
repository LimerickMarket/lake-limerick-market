class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :phone, format: { with: /\A[0-9\-\(\)\s]+\z/, allow_blank: true }
end
