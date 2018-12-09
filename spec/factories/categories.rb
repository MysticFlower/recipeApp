# after creating the model we needed the sample data as post belongs to categories we need associatoin
FactoryGirl.define do 
  factory :category do
    sequence(:name) { |n| "name#{n}" }
    sequence(:branch) { |n| "branch#{n}" }
  end
end