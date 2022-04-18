require "test_helper"

class EventTest < ActiveSupport::TestCase
  
  #Matchers
  should have_many(:hosts)
  should have_many(:invites)
  should have_many(:organization_events)
  should have_many(:users).through(:hosts)
  should have_many(:users).through(:invites)
  should have_many(:organizations).through(:organization_events)


  context "Creating events context" do
    # create the objects I want with factories
    setup do 
      create_events
      create_users
      create_invites
      create_hosts
    end
    
    # and provide a teardown method as well
    teardown do
      destroy_events
      destroy_users
      destroy_invites
      destroy_hosts
    end
  
    # now run the tests:
    # test the scope 'alphabetical'
    should "show that events are listed in alphabetical order" do
      assert_equal ["Art Night", "Charity Dinner", "Coffee Chat with IS Profs", "Dance Party", "Kappa Sigma Partay", "Sigma Nu Party"], Event.alphabetical.map{|e| e.name}
    end
    
    # test the scope 'forHost'
    should "show the events for a given host" do
      assert_equal 2, Event.forHost(3).size # user sara's id
      assert_equal ["Art Night", "Charity Dinner"], Event.forHost(3).alphabetical.map{|e| e.name}
    end

    # test the scope 'forGuest'
    should "show the events for a given guest" do
      assert_equal 4, Event.forGuest(2).size # user grace's id
      assert_equal ["Charity Dinner", "Coffee Chat with IS Profs", "Dance Party", "Sigma Nu Party"], Event.forGuest(2).alphabetical.map{|e| e.name}
    end

    # test the scope 'current'
    should "show all the current events" do
      assert_equal 0, Event.current.size
      assert_equal [], Event.current.alphabetical.map{|e| e.name}.sort
    end

    # test the scope 'past'
    should "show all the past events" do
      assert_equal 3, Event.past.size
      assert_equal ["Coffee Chat with IS Profs", "Dance Party", "Sigma Nu Party"], Event.past.alphabetical.map{|e| e.name}.sort
    end

    # test the scope 'upcoming'
    should "show all the upcoming events" do
      assert_equal 3, Event.upcoming.size
      assert_equal ["Art Night", "Charity Dinner", "Kappa Sigma Partay"], Event.upcoming.alphabetical.map{|e| e.name}.sort
    end

  end


  
end
