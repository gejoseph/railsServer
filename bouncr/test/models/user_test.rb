require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  should have_many(:hosts)
  should have_many(:invites)
  should have_many(:events).through(:hosts)
  should have_many(:events).through(:invites)

  should have_many(:initiatedFriendships)
  should have_many(:recievedFriendships)

  context "Creating users context" do
    # create the objects I want with factories
    setup do 
      create_users
    end
    
    # and provide a teardown method as well
    teardown do
      destroy_users
    end
  
    # now run the tests:
    # test the scope 'alphabetical'
    should "show that users are listed in alphabetical order" do
      assert_equal ["gjoseph", "johnd", "khu", "msergent",  "profh", "saung", "ssong"], User.alphabetical.map{|e| e.username}
    end
    
    # test the scope 'search'
    should "show the users given a search keyword" do
      assert_equal ["gjoseph"], User.search("gjoseph").map{|e| e.username}
    end

    # test the scope 'for_hosting'
    should "show the users that are hosting a given event" do
      assert_equal ["profh"], User.for_hosting(1).map{|e| e.username}
    end

    # test the scope 'for_invited'
    should "show the users that are invited to a given event" do
      assert_equal ["khu", "gjoseph"], User.for_invited(0, false).map{|e| e.username}
    end

    # test the scope 'initiatedFriendship'
    should "show all the users that a given user friend requested (initiated)" do
      assert_equal 2, User.initiated_friendship(2, false).size # user kenny's id
      assert_equal ["gjoseph", "shsong"], User.initiated_friendship(2, false).alphabetical.map{|e| e.username}
    end

    # test the scope 'receivedFriendship'
    should "show all the users that a given user friend requested (received)" do
      assert_equal 1, User.recieved_friendship(2, false).size # user kenny's id
      assert_equal ["saung"], User.recieved_friendship(2, false).alphabetical.map{|e| e.username}
    end

  end

end
