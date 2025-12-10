class ContactInquiry < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true

  # Scopes
  scope :unread, -> { where(read: false) }
  scope :recent, -> { order(created_at: :desc) }

  # Callbacks
  before_validation :set_default_read, on: :create

  private

  def set_default_read
    self.read = false if read.nil?
  end
end
