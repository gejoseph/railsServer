class ResponseStatusBlueprint < Blueprinter::Base
    # Don't need identifier??

    # IDK if these are right??
    field :returnValue do |options|
        options[:returnValue]
    end
    field :returnString do |options|
        options[:returnString]
    end
end
