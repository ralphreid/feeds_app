# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "User"
    sequence(:last_name) { |n| "#{n}"}
    email { "#{first_name}#{last_name}@email.com" }
    password "password"
    role "user"
  end
end
