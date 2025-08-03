module Pages
  class JobListing < ApplicationRecord
    belongs_to :user
    has_rich_text :body
    has_one_attached :meta_image
    has_one_attached :bunner_image
  end
end
