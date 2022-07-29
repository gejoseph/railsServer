module Contexts
    module Friends

        def create_friends
            @kenny_grace    = FactoryBot.create(:friend, user1: @kenny, user2: @grace)
            @kenny_sara     = FactoryBot.create(:friend, user1: @kenny, user2: @sara)
            @grace_sara     = FactoryBot.create(:friend, user1: @grace, user2: @sara, accepted: true)
            @shane_kenny    = FactoryBot.create(:friend, user1: @shane, user2: @kenny, accepted: true)
            @shane_profh    = FactoryBot.create(:friend, user1: @shane, user2: @profh)
            @profh_max      = FactoryBot.create(:friend, user1: @profh, user2: @max, accepted: true)
            @john_sara      = FactoryBot.create(:friend, user1: @john, user2: @sara)
            @john_shane     = FactoryBot.create(:friend, user1: @john, user2: @shane, accepted: true)
            @profh_john     = FactoryBot.create(:friend, user1: @profh, user2: @john)
            @grace_max      = FactoryBot.create(:friend, user1: @grace, user2: @max, accepted: true)
            @max_sara       = FactoryBot.create(:friend, user1: @max, user2: @sara)
            @max_shane      = FactoryBot.create(:friend, user1: @max, user2: @shane, accepted: true)
            @sara_shane     = FactoryBot.create(:friend, user1: @sara, user2: @shane, accepted: true)
            @sara_profh     = FactoryBot.create(:friend, user1: @sara, user2: @profh)
            @grace_shane    = FactoryBot.create(:friend, user1: @grace, user2: @shane, accepted: true)
        end

        def destroy_friends
            @kenny_grace.destroy
            @kenny_sara.destroy
            @grace_sara.destroy
            @shane_kenny.destroy
            @shane_profh.destroy
            @profh_max.destroy
            @john_sara.destroy
            @john_shane.destroy
            @profh_john.destroy
            @grace_max.destroy
            @max_sara.destroy
            @max_shane.destroy
            @sara_shane.destroy
            @sara_profh.destroy
            @grace_shane.destroy
        end

    end
end