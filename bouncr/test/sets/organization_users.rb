module Contexts
    module OrganizationUsers

        def create_organization_users
            @kpdc_profh     = FactoryBot.create(:organization_user, organization: @kpdc, user: @profh)
            @signu_john     = FactoryBot.create(:organization_user, organization: @signu, user: @john, isAdmin: true)
            @signu_kenny    = FactoryBot.create(:organization_user, organization: @signu, user: @kenny)
            @art_club_grace = FactoryBot.create(:organization_user, organization: @art_club, user: @grace)
            @art_club_sara  = FactoryBot.create(:organization_user, organization: @art_club, user: @sara)
            @akdp_sara      = FactoryBot.create(:organization_user, organization: @akdp, user: @sara)
            @kapsig_max     = FactoryBot.create(:organization_user, organization: @kapsig, user: @max)
            @cmu_shane      = FactoryBot.create(:organization_user, organization: @cmu, user: @shane)
        end

        def destroy_organization_users
            @kpdc_profh.destroy
            @signu_john.destroy
            @signu_kenny.destroy
            @art_club_grace.destroy
            @art_club_sara.destroy
            @akdp_sara.destroy
            @kapsig_max.destroy
            @cmu_shane.destroy
        end

    end
end