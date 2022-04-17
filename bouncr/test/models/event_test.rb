require "test_helper"

class EventTest < ActiveSupport::TestCase
  #Matchers
  should have_many(:hosts)
  # More matchers here...
end
