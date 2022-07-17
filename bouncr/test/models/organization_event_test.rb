require "test_helper"

class OrganizationEventTest < ActiveSupport::TestCase
  
  should belong_to(:organization)
  should belong_to(:event)
  
end
