require "test_helper"

class InviteTest < ActiveSupport::TestCase
  
  #Matchers
  should belong_to(:user)
  should belong_to(:event)

  context "Creating invites context" do
    # create the objects I want with factories
    setup do 
      create_events
      create_users
      create_hosts
      create_invites
    end
    
    # and provide a teardown method as well
    teardown do
      destroy_events
      destroy_users
      destroy_hosts
      destroy_invites
    end
  
    # now run the tests:
    # test the scope 'by_user'
    should "show the invites for a given user" do
      assert_equal 2, Invite.by_user(4).size # user sara's id
      assert_equal [@sara_signu_party, @sara_coffee_chat], Invite.by_user(4)
    end

    # test the scope 'by_event'
    should "show the invites for a given event" do
      assert_equal 4, Invite.by_event(4).size # event sig nu party id
      assert_equal [@sara_signu_party, @max_signu_party, @shane_signu_party, @grace_signu_party], Invite.by_event(4)
    end

    # test the scope 'checkedIn'
    should "show checkedIn invites" do
      assert_equal 13, Invite.checkedIn.size
      assert_equal [@kenny_dance_party, @grace_dance_party, @shane_art_night, @max_art_night, @grace_charity_event, @profh_charity_event, @max_signu_party, @shane_signu_party, @grace_signu_party, @profh_coffee_chat, @sara_coffee_chat, @kenny_coffee_chat, @grace_coffee_chat], Invite.checkedIn
    end
  
  end

end
