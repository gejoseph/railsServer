FactoryBot.define do
    factory :host do
        association :user
        association :event
    end
end