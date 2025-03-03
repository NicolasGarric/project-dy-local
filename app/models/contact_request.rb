class ContactRequest < ApplicationRecord
  validates :first_name, :last_name, :email, :phone_number, :message, :start_date, :end_date, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, format: { with: /\A[0-9+(). -]{10,15}\z/ }
  validates :message, length: { minimum: 50 }

  validate :start_date_before_end_date

  def start_date_before_end_date
    if start_date.present? && end_date.present? && start_date > end_date
      errors.add(:start_date, "doit être antérieure à la date de fin")
    end
  end
end
