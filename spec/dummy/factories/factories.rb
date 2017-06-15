FactoryGirl.define do
  factory :dog do
    sequence(:user_id)
    name     'Cristiano Ruffnaldo'
    birthday Time.local(2015,1,1)
    size     "M"
    sequence(:image_url) { |n| "http://www.example_image_url_#{n}.jpg" }
  end
end