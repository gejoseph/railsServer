class InviteBlueprint < Blueprinter::Base
  identifier :id
  
  view :normal do
    fields :checkinTime, :inviteStatus, :coverChargePaid, :event_id , :user_id
  end
  
  view :with_event do
    include_view :normal
    association :event, blueprint: EventBlueprint, view: :normal
  end 

  view :with_user do
    association :user, blueprint: UserBlueprint, view: :normal
  end
  
end
