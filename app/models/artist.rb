class Artist < ApplicationRecord
  # Active Storage attachments
  has_one_attached :profile_image

  # Validations
  validates :name, presence: true
  validates :bio, presence: true

  # Class method to get or create the singleton artist record
  def self.instance
    first_or_create!(name: "Artist Name", bio: "Artist bio goes here...")
  end
end
