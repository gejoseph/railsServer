class FriendBlueprint < Blueprinter::Base
  identifier :id
  
  fields :accepted
  association :user1, blueprint: UserBlueprint, view: :normal
  association :user2, blueprint: UserBlueprint, view: :normal

end
