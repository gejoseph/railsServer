class OrganizationBlueprint < Blueprinter::Base
  #has_many :events , through: :organization_events
  fields :name
end
