module Contexts
    module Events

        def create_events
            @dance_party    = FactoryBot.create(:event)
            @art_night      = FactoryBot.create(:event, 
                                                name: "Art Night", 
                                                startTime: DateTime.new(2022, 9, 24, 12, 0, 0), 
                                                endTime: DateTime.new(2022, 9, 24, 15, 0, 0),
                                                street1: "46 Tappan St",
                                                street2: "Rm 203",
                                                city: "Brookline",
                                                state: "MA",
                                                zip: "02445",
                                                description: "Come make lots of cool stuff with us!!",
                                                friendsAttendingVisible: true,
                                                attendenceCap: 30,
                                                coverCharge: 0,
                                                venueLatitude: 42.33172248968372, 
                                                venueLongitude: -71.1276910319482)
            @charity_event  = FactoryBot.create(:event,
                                                name: "Charity Dinner",
                                                startTime: DateTime.new(2022, 05, 01, 20, 0, 0), 
                                                endTime: DateTime.new(2022, 05, 01, 23, 0, 0),
                                                street1: "67 Fifth Ave",
                                                street2: "Rm 443",
                                                description: "Every dollar donated during this dinner goes towards helping people in need",
                                                attendenceVisible: false,
                                                coverCharge: 0,
                                                isOpenInvite: true,
                                                venueLatitude: 40.44221987732466, 
                                                venueLongitude: -80.00264637352394)
            @signu_party    = FactoryBot.create(:event,
                                                name: "Sigma Nu Party",
                                                startTime: DateTime.new(2022, 01, 20, 22, 0, 0), 
                                                endTime: DateTime.new(2022, 01, 21, 3, 0, 0),
                                                street1: "104 Margaret Morrison Street",
                                                description: "Lots of drinks, come have a good time!",
                                                friendsAttendingVisible: true,
                                                attendenceCap: 25,
                                                coverCharge: 30,
                                                venueLatitude: 40.442134416284475,
                                                venueLongitude: -79.93884754468831)
            @kapsig_party   = FactoryBot.create(:event,
                                                name: "Kappa Sigma Partay",
                                                startTime: DateTime.new(2022, 05, 11, 21, 0, 0), 
                                                endTime: DateTime.new(2022, 05, 12, 4, 0, 0),
                                                street1: "1063 Morewood Avenue",
                                                description: "Celebrate the end of the semester with us!!!",
                                                friendsAttendingVisible: true,
                                                attendenceCap: 40,
                                                coverCharge: 30,
                                                venueLatitude: 40.44561063680285, 
                                                venueLongitude: -79.94143980235951)
            @coffee_chat    = FactoryBot.create(:event,
                                                name: "Coffee Chat with IS Profs",
                                                startTime: DateTime.new(2022, 04, 07, 8, 0, 0), 
                                                endTime: DateTime.new(2022, 04, 07, 9, 0, 0),
                                                street1: "4800 Forbes Ave",
                                                street2: "Rm 1002",
                                                description: "Sign up to chat with some IS professors during Carnival!",
                                                attendenceCap: 10,
                                                coverCharge: 0,
                                                isOpenInvite: true,
                                                venueLatitude: 40.4445165337803, 
                                                venueLongitude: -79.94553821758295)
        end

        def destroy_events
            @dance_party.destroy
            @art_night.destroy
            @charity_event.destroy
            @signu_party.destroy
            @kapsig_party.destroy
            @coffee_chat.destroy
        end

    end
end