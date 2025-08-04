module Pages
  class JobListing < ApplicationRecord
    # associations
    belongs_to :user
    has_rich_text :body
    has_one_attached :meta_image
    has_one_attached :bunner_image
    # validations
    validates :title, presence: true, length: { minimum: 5 }
    validates :location, presence: true
    validates :company, presence: true
    # validates :company_website, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "must be a valid URL" }
    validates :body, presence: true, length: { minimum: 20 }
    validates :user_id, presence: true
    # validates :meta_image, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 5.megabytes, message: 'must be less than 5MB' }
    # validates :bunner_image, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 5.megabytes, message: 'must be less than 5MB' }

    # Scope para busca
    scope :search, ->(query) { where("title LIKE ? OR tags LIKE ?", "%#{query}%", "%#{query}%") }
  end
end
# Isso tornou a consulta reutilizável e o controller mais legível.
