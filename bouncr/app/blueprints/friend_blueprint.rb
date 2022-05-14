class FriendBlueprint < Blueprinter::Base
  identifier :id
  fields :accepted
  association :user1, blueprint: UserBlueprint, view: :normal
  association :user2, blueprint: UserBlueprint, view: :normal
  
  # belongs_to :user1, record_type: :user
  # belongs_to :user2, record_type: :user
  # attributes :user1, :user2, :accepted
end
