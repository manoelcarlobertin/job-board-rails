FactoryBot.define do
  factory :pages_job_listing, class: 'Pages::JobListing' do
    title { "MyString" }
    salary { "MyString" }
    body { nil }
    company { "MyString" }
    location { "MyString" }
    meta_image { nil }
    bunner_image { nil }
    tags { "MyString" }
    user { nil }
  end
end
