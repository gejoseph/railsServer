# require needed files
require './test/sets/events'
require './test/sets/users'
require './test/sets/organizations'
require './test/sets/organization_users'
require './test/sets/organization_events'
require './test/sets/friends'
require './test/sets/hosts'
require './test/sets/invites'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Events
  include Contexts::Users
  include Contexts::Organizations
  include Contexts::OrganizationUsers
  include Contexts::OrganizationEvents
  include Contexts::Friends
  include Contexts::Hosts
  include Contexts::Invites
  
  def create_all
    puts "Building contexts..."
    create_events
    create_users
    create_organizations
    create_organization_users
    create_organization_events
    create_friends
    create_hosts
    create_invites
    puts "Contexts built"
  end
  
end