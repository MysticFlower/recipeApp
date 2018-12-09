FactoryGirl.define do 
    #testing the user login data
  factory :user do
    sequence(:name) { |n| "shabeena#{n}" }
    sequence(:email) { |n| "shabeena#{n}@test.com" }
    password 'Creating@123'
    password_confirmation 'Creating@123'
  end
end