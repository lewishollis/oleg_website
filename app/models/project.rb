class Project < ApplicationRecord
  # Associations
  has_many :artworks, -> { order(position: :asc) }, dependent: :destroy

  # Active Storage attachments
  has_one_attached :cover_image

  # Validations
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  # Scopes
  scope :published, -> { where(published: true) }
  scope :by_position, -> { order(position: :asc, created_at: :desc) }
  scope :with_artworks, -> { where(id: Artwork.select(:project_id).distinct) }

  # Callbacks - normalize title to ensure consistency
  before_validation :normalize_title
  before_validation :set_default_position, on: :create

  private

  def normalize_title
    self.title = title.to_s.strip.titleize if title.present?
  end

  def set_default_position
    self.position ||= (Project.maximum(:position) || 0) + 1
  end
end
