FactoryBot.define do
    factory :organization_event do
        association :organization
        association :event
    end
end