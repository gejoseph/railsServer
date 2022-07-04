FactoryBot.define do
    factory :friend do
        association :user1
        association :user2
        accepted { false }
    end
end