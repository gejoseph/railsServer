class EventBlueprint < Blueprinter::Base
  identifier :id
  
  view :normal do
    fields :name, :startTime, :endTime, :street1, :street1, :street2, :city, :zip, :description, :state,
           :attendenceCap, :attendenceVisible, :friendsAttendingVisible, :coverCharge, :isOpenInvite, :venueLatitude, :venueLongitude
  end

  view :show do
    include_view :normal
    association :organizations, through: :organization_events, blueprint: OrganizationBlueprint
  end
end
