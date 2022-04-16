FactoryBot.define do
    factory :event do
        name { "Dance Party" }
        startTime { DateTime.new(2022, 04, 15, 10, 0, 0) }
        endTime { DateTime.new(2022, 04, 15, 12, 30, 0) }
        street1 { "123 Forbes Ave" }
        street2 { nil }
        city { "Pittsburgh" }
        state { "PA" }
        zip { 15213 }
        description { "This dance party is super awesome, gonna do the Cotton-Eye Joe all night!!!" }
        attendenceVisible { true }
        friendsAttendingVisible { false }
        attendenceCap { 20 }
        coverCharge { 10 }
        isOpenInvite { false }
        venueLatitude { 40.44437309784734 }
        venueLongitude { -79.94564023258341 }
    end
end
  