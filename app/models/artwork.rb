class Artwork < ApplicationRecord
  # Associations
  belongs_to :project

  # Active Storage attachments
  has_one_attached :image
  has_many_attached :images

  # Validations
  validates :title, presence: true
  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  # Callbacks
  before_validation :set_default_position, on: :create

  # Scopes
  scope :by_position, -> { order(position: :asc, created_at: :desc) }

  private

  def set_default_position
    self.position ||= (project.artworks.maximum(:position) || 0) + 1
  end
end
