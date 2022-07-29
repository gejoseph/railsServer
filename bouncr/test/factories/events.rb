FactoryBot.define do
    factory :event do
        name { "Dance Party" }
        startTime { DateTime.new(2022, 4, 15, 10, 0, 0) }
        endTime { DateTime.new(2022, 4, 15, 12, 30, 0) }
        street1 { "123 Forbes Ave" }
        street2 { nil }
        city { "Pittsburgh" }
        state { "PA" }
        zip { 15213 }
        description { "This dance party is super awesome, gonna do the Cotton-Eye Joe all night!!!" }
        attendenceVisible { true }
        friendsAttendingVisible { false }
        attendenceCap { 20 }
        coverCharge { 10.00 }
        isOpenInvite { false }
        venueLatitude { 40.44119848422531 }
        venueLongitude { -80.00313621585269 }
    end
end
  