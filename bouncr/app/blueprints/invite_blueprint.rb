class InviteBlueprint < Blueprinter::Base
  identifier :id

  association :event, blueprint: EventBlueprint, view: :normal
  association :user, blueprint: UserBlueprint, view: :normal
  fields :checkinTime, :inviteStatus, :checkinStatus, :coverChargePaid

  # belongs_to :event
  # belongs_to :user
  # attributes :checkinTime , :inviteStatus, :checkinStatus , :coverChargePaid
end
