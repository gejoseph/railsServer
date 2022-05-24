class InviteBlueprint < Blueprinter::Base
  identifier :id

  # association :event, blueprint: EventBlueprint, view: :normal
  # association :user, blueprint: UserBlueprint, view: :normal
  
  
  view :normal do
    fields :checkinTime, :inviteStatus, :checkinStatus, :coverChargePaid
  end
  
  view :with_event do
    include_view :normal
    association :event, blueprint: EventBlueprint, view: :normal
  end 

  view :with_user do
    association :user, blueprint: UserBlueprint, view: :normal
  end

  # belongs_to :event
  # belongs_to :user
  # attributes :checkinTime , :inviteStatus, :checkinStatus , :coverChargePaid
end
