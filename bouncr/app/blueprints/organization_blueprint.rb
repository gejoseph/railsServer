class OrganizationBlueprint < Blueprinter::Base
  identifier :id
  
  #has_many :events , through: :organization_events
  fields :name, :orgType
end
