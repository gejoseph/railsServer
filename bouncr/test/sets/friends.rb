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
        end

        def destroy_friends
            @kenny_grace.destroy
            @kenny_sara.destroy
            @grace_sara.destroy
            @shane_kenny.destroy
            @shane_profh.destroy
            @profh_max.destroy
            @john_sara.destroy
        end

    end
end