# require needed files
require './test/sets/events'
require './test/sets/friends'
require './test/sets/hosts'
require './test/sets/invites'
require './test/sets/organization_events'
require './test/sets/organization_users'
require './test/sets/organizations'
require './test/sets/users'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Events
  include Contexts::Friends
  include Contexts::Hosts
  include Contexts::Invites
  include Contexts::OrganizationEvents
  include Contexts::OrganizationUsers
  include Contexts::Organizations
  include Contexts::Users
  
  def create_all
    puts "Building contexts..."
    create_events
    create_friends
    create_hosts
    create_invites
    create_organization_events
    create_organization_users
    create_organizations
    create_users
    puts "Contexts built"
  end
  
end