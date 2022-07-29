require "test_helper"

class HostTest < ActiveSupport::TestCase
  
  should belong_to(:user)
  should belong_to(:event)

  context "Creating hosts context" do
    # create the objects I want with factories
    setup do 
      create_users
      create_events
      create_hosts
    end
    
    # and provide a teardown method as well
    teardown do
      destroy_users
      destroy_events
      destroy_hosts
    end
  
    # now run the tests:
    # test the scope 'by_user'
    should "show the hosts for a given user" do
      assert_equal 2, Host.by_user(4).size # user sara's id
      assert_equal [@sara_art_night, @sara_charity_event], Host.by_user(4)
    end

     # test the scope 'by_event'
     should "show the hosts for a given event" do
      assert_equal 1, Host.by_event(4).size # event sig nu party id
      assert_equal [@john_signu_party], Host.by_event(4)
    end

  end

end
