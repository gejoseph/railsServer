require "test_helper"

class OrganizationUserTest < ActiveSupport::TestCase
  
  should belong_to(:organization)
  should belong_to(:user)

end
