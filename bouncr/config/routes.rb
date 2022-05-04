Rails.application.routes.draw do
  apipie
  resources :organization_users
  resources :organization_events
  resources :organizations
  resources :friends
  resources :invites
  resources :events
  resources :hosts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users



  # given user id and target user id, send friendship
  
  # given user id and target user id, accept friendship

  # given user id and target user id, decline friendship

  # given user id as a param and the event init values in the post body, create the event and set user as host

  # given userid and eventy id, create a host relationship

  # given userid and eventy id, create a invite relationship with reasonable init values


  # given userID, get all event user is hosting, return an array of Event obj
  get "/host_events", to: "events#host_events"

  #given userID, get all of user's invites, return an array of Invite obj, with Event attached
  get "/guest_invites", to: "invites#guest_invites"

  # #given userID, get all events user is invited to
  # get "/guest_events", to: "events#guest_events"

  #given userID, get all friends, return an array of otheruser
  get "/user_friends", to: "friends#user_friends"

  #dont change lol
  get "/login", to: "users#login"

  #given eventID and checkedIn status(bool), get all invited users of that invite status. params are id and checkedIn, return an array of otheruser
  get "/event_guests", to: 'users#event_guests'

  #given eventID, get all users hosting the event, return an array of otheruser
  get "/event_hosts", to:'users#event_hosts'


  #auto login gets all user details too
  get "/auto_login", to: "users#auto_login"

  #given search term, get all similar users, return an array of otheruser
  get "/users_search", to: 'users#index_for_search'
  
end
