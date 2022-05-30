module Contexts
    module Invites

        def create_invites
            # Dance Party Invites ==============================================
            @kenny_dance_party      = FactoryBot.create(:invite,
                                                        user: @kenny,
                                                        event: @dance_party,
                                                        checkinTime: DateTime.new(2022, 4, 15, 10, 5, 0))
            @grace_dance_party      = FactoryBot.create(:invite,
                                                        user: @grace,
                                                        event: @dance_party,
                                                        checkinTime: DateTime.new(2022, 4, 15, 10, 12, 0),
                                                        coverChargePaid: 10.00)

            # Art Night Invites ================================================
            @shane_art_night        = FactoryBot.create(:invite,
                                                        user: @shane,
                                                        event: @art_night,
                                                        checkinTime: DateTime.new(2022, 9, 24, 13, 5, 0),
                                                        coverChargePaid: 0)
            @john_art_night         = FactoryBot.create(:invite,
                                                        user: @john,
                                                        event: @art_night,
                                                        checkinTime: nil,
                                                        inviteStatus: false,
                                                        checkinStatus: false,
                                                        coverChargePaid: 0)
            @max_art_night          = FactoryBot.create(:invite,
                                                        user: @max,
                                                        event: @art_night,
                                                        checkinTime: DateTime.new(2022, 9, 24, 14, 0, 0),
                                                        coverChargePaid: 0)
            
            # Charity Event Invites ============================================
            @grace_charity_event    = FactoryBot.create(:invite,
                                                        user: @grace,
                                                        event: @charity_event,
                                                        checkinTime: DateTime.new(2022, 5, 1, 20, 0, 0),
                                                        coverChargePaid: 0)
            @profh_charity_event    = FactoryBot.create(:invite,
                                                        user: @profh,
                                                        event: @charity_event,
                                                        checkinTime: DateTime.new(2022, 5, 1, 21, 0, 12),
                                                        coverChargePaid: 0)
            @kenny_charity_event    = FactoryBot.create(:invite,
                                                        user: @kenny,
                                                        event: @charity_event,
                                                        checkinTime: nil,
                                                        checkinStatus: false,
                                                        coverChargePaid: 0)

            # Signu Party Invites ==============================================
            @sara_signu_party       = FactoryBot.create(:invite,
                                                        user: @sara,
                                                        event: @signu_party,
                                                        checkinTime: nil,
                                                        inviteStatus: false,
                                                        checkinStatus: false,
                                                        coverChargePaid: 0)
            @max_signu_party        = FactoryBot.create(:invite,
                                                        user: @max,
                                                        event: @signu_party,
                                                        checkinTime: DateTime.new(2022, 1, 20, 22, 0, 0),
                                                        coverChargePaid: 20)
            @shane_signu_party      = FactoryBot.create(:invite,
                                                        user: @shane,
                                                        event: @signu_party,
                                                        checkinTime: DateTime.new(2022, 1, 20, 23, 36, 1),
                                                        coverChargePaid: 30)
            @grace_signu_party      = FactoryBot.create(:invite,
                                                        user: @grace,
                                                        event: @signu_party,
                                                        checkinTime: DateTime.new(2022, 1, 20, 1, 23, 45),
                                                        coverChargePaid: 30)

            # Kapsig Party Invites =============================================
            @john_kapsig_party      = FactoryBot.create(:invite,
                                                        user: @john,
                                                        event: @kapsig_party,
                                                        checkinTime: nil,
                                                        inviteStatus: false,
                                                        checkinStatus: false,
                                                        coverChargePaid: 0)
            @kenny_kapsig_party     = FactoryBot.create(:invite,
                                                        user: @kenny,
                                                        event: @kapsig_party,
                                                        checkinTime: nil,
                                                        checkinStatus: false,
                                                        coverChargePaid: 0)
            @profh_kapsig_party     = FactoryBot.create(:invite,
                                                        user: @profh,
                                                        event: @kapsig_party,
                                                        checkinTime: nil,
                                                        inviteStatus: false,
                                                        checkinStatus: false,
                                                        coverChargePaid: 0)

            # Coffee Chat Invites ==============================================
            @profh_coffee_chat      = FactoryBot.create(:invite,
                                                        user: @profh,
                                                        event: @coffee_chat,
                                                        checkinTime: DateTime.new(2022, 4, 7, 8, 0, 0),
                                                        coverChargePaid: 0)
            @sara_coffee_chat       = FactoryBot.create(:invite,
                                                        user: @sara,
                                                        event: @coffee_chat,
                                                        checkinTime: DateTime.new(2022, 4, 7, 8, 12, 0),
                                                        coverChargePaid: 0)
            @kenny_coffee_chat      = FactoryBot.create(:invite,
                                                        user: @kenny,
                                                        event: @coffee_chat,
                                                        checkinTime: DateTime.new(2022, 4, 7, 8, 31, 0),
                                                        coverChargePaid: 0)
            @grace_coffee_chat      = FactoryBot.create(:invite,
                                                        user: @grace,
                                                        event: @coffee_chat,
                                                        checkinTime: DateTime.new(2022, 4, 7, 8, 1, 43),
                                                        coverChargePaid: 0)
        end

        def destroy_invites
            @kenny_dance_party.destroy
            @grace_dance_party.destroy

            @shane_art_night.destroy
            @john_art_night.destroy
            @max_art_night.destroy

            @grace_charity_event.destroy
            @profh_charity_event.destroy
            @kenny_charity_event.destroy

            @sara_signu_party.destroy
            @max_signu_party.destroy
            @shane_signu_party.destroy
            @grace_signu_party.destroy

            @john_kapsig_party.destroy
            @kenny_kapsig_party.destroy
            @profh_kapsig_party.destroy

            @profh_coffee_chat.destroy
            @sara_coffee_chat.destroy
            @kenny_coffee_chat.destroy
            @grace_coffee_chat.destroy
        end

    end
end