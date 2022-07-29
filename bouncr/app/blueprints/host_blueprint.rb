class HostBlueprint < Blueprinter::Base
  identifier :id

  association :event, blueprint: EventBlueprint, view: :normal
  association :user, blueprint: UserBlueprint, view: :normal
end
