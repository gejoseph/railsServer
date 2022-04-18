require "test_helper"

class OrganizationTest < ActiveSupport::TestCase

  should have_many(:organization_events)
  should have_many(:events).through(:organization_events)

end
