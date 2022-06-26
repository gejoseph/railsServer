require "test_helper"

class FriendTest < ActiveSupport::TestCase

  should belong_to(:user1)
  should belong_to(:user2)

  context "Creating friends context" do
    # create the objects I want with factories
    setup do 
      create_users
      create_friends
    end
    
    # and provide a teardown method as well
    teardown do
      destroy_users
      destroy_friends
    end
  
    # now run the tests:
    # test the scope 'accepted'
    should "show accepted friend requests" do
      assert_equal [@grace_sara, @shane_kenny, @profh_max], Friend.accepted
    end

    # test the scope 'byUser'
    should "show the friend requests for a given user" do
      assert_equal 3, Friend.by_user(4).size # user sara's id
      assert_equal [@kenny_sara, @grace_sara, @john_sara], Friend.by_user(4)
    end

  end
  
end
