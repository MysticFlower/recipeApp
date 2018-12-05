FactoryGirl.define do 
    #testing the user login data
  factory :user do
    sequence(:name) { |n| "shabeena#{n}" }
    sequence(:email) { |n| "shabeena#{n}@test.com" }
    password '098767'
    password_confirmation '098767'
  end
end