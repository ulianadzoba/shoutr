FactoryBot.define do
    factory :user do
        username { "username" }
        sequence(:email) { |n| "person#{n}@example.com" }
        password { "password" }
    end
end