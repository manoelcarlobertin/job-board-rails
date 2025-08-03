json.extract! pages_job_listing, :id, :title, :salary, :body, :company, :location, :meta_image, :bunner_image, :tags, :user_id, :created_at, :updated_at
json.url pages_job_listing_url(pages_job_listing, format: :json)
json.body pages_job_listing.body.to_s
json.meta_image url_for(pages_job_listing.meta_image)
json.bunner_image url_for(pages_job_listing.bunner_image)
