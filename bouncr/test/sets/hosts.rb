module Contexts
    module Hosts

        def create_hosts
            @profh_dance_party  = FactoryBot.create(:host, user: @profh, event: @dance_party)
            @sara_art_night     = FactoryBot.create(:host, user: @sara, event: @art_night)
            @sara_charity_event = FactoryBot.create(:host, user: @sara, event: @charity_event)
            @john_signu_party   = FactoryBot.create(:host, user: @john, event: @signu_party)
            @max_kapsig_party   = FactoryBot.create(:host, user: @max, event: @kapsig_party)
            @shane_coffee_chat  = FactoryBot.create(:host, user: @shane, event: @coffee_chat)
        end

        def destroy_hosts
            @profh_dance_party.destroy
            @sara_art_night.destroy
            @sara_charity_event.destroy
            @john_signu_party.destroy
            @max_kapsig_party.destroy
            @shane_coffee_chat.destroy
        end

    end
end