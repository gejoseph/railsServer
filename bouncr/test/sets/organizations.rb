module Contexts
    module Organizations

        def create_organizations
            @kpdc       = FactoryBot.create(:organization)
            @signu      = FactoryBot.create(:organization, name: "Sigma Nu", type: "Fraternity")
            @art_club   = FactoryBot.create(:organization, name: "BHS Art Club", type: "Student Club")
            @akdp       = FactoryBot.create(:organization, name: "Alpha Kappa Delta Phi", type: "Sorority")
            @kapsig     = FactoryBot.create(:organization, name: "Kappa Sigma", type: "Fraternity")
            @cmu        = FactoryBot.create(:organization, name: "Carnegie Mellon University", type: "School")
        end

        def destroy_organizations
            @kpdc.destroy
            @signu.destroy
            @art_club.destroy
            @akdp.destroy
            @kapsig.destroy
            @cmu.destroy
        end

    end
end