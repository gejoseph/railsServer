class UserBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :username, :email, :firstName, :lastName, :phoneNumber, :birthday
  end

  view :other_user do
    fields :username, :firstName, :lastName
  end

  # Add new view w/ token input

  view :login do
    #fields :username, :email, :firstName, :lastName, :phoneNumber, :birthday
    fields (:token) do |_user, options|
      options[:token]
    end
  end
end
