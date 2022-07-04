module Contexts
    module OrganizationEvents

        def create_organization_events
            @kpdc_dance             = FactoryBot.create(:organization_event, organization: @kpdc, event: @dance_party)
            @artclub_artnight       = FactoryBot.create(:organization_event, organization: @art_club, event: @art_night)
            @akdp_charity           = FactoryBot.create(:organization_event, organization: @akdp, event: @charity_event)
            @signu_signu_party      = FactoryBot.create(:organization_event, organization: @signu, event: @signu_party)
            @kapsig_kapsig_party    = FactoryBot.create(:organization_event, organization: @kapsig, event: @kapsig_party)
            @cmu_coffee             = FactoryBot.create(:organization_event, organization: @cmu, event: @coffee_chat)
        end

        def destroy_organization_events
            @kpdc_dance.destroy
            @artclub_artnight.destroy
            @akdp_charity.destroy
            @signu_signu_party.destroy
            @kapsig_kapsig_party.destroy
            @cmu_coffee.destroy
        end

    end
end