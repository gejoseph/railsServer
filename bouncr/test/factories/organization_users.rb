FactoryBot.define do
    factory :organization_user do
        association :organization
        association :user
        isAdmin { false }
    end
end