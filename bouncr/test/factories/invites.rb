FactoryBot.define do
    factory :invite do
        association :user
        association :event
        checkinTime { DateTime.new(2022, 03, 20, 5, 0, 0) }
        inviteStatus { true }
        checkinStatus { true }
        phoneNumber { 1231231234 }
        coverChargePaid { 2.00 }
    end
end