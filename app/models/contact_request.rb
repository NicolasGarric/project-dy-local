class ContactRequest
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :company_name, :email, :phone_number, :message

  validates :first_name, :last_name, :email, :phone_number, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, format: { with: /\A[0-9+(). -]{10,15}\z/ }
  validates :message, length: { minimum: 50 }
end
