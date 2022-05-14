class UserBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :username, :email, :firstName, :lastName, :phoneNumber
  end

  view :other_user do
    fields :username, :firstName, :lastName
  end
end
