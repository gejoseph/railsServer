Rails.application.routes.draw do
  apipie
  resources :organization_users
  resources :organization_events
  resources :organizations
  #resources :friends
  resources :invites
  resources :events
  resources :hosts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users


  # also for the index guest end point in the rails api, can we have params id, checkinStatus, inviteStatus to make it cleaner

  #for testing 
  get "/friends", to: "friends#show"
  
  # given user id and target user id, send friendship request
  post "/friends", to: "friends#create"
  
  # given user id and target user id, accept friendship
  patch "/friends", to: "friends#update"

  # given user id and target user id, decline friendship
  delete "/friends", to: "friends#destroy"

  #given userID, get all friends, return an array of other users
  get "/user_friends", to: "users#index_friends"

  #given userID, get all friends requests, return an array of other users 
  get "/user_friend_requests", to: "users#index_friend_requests"

  # given user id as a param and the event init values in the post body, create the event and set user as host
  post "/events", to: "event#create"

  # given userid and event id, create a host relationship
  post "/hosts", to: "host#create"

  # given userid and event id, create a invite relationship with reasonable init values
  post "/events", to: "invite#create"

  # given userID, get all event user is hosting, return an array of Event obj
  get "/host_events", to: "events#host_events"

  #given userID, get all of user's invites, return an array of Invite obj, with Event attached
  get "/guest_invites", to: "invites#guest_invites"

  # #given userID, get all events user is invited to
  # get "/guest_events", to: "events#guest_events"



  #dont change lol
  get "/login", to: "users#login"

  #given eventID and checkinStatus(bool), get all invited users of that invite status. params are id and checkinStatus, return an array of otheruser
  get "/event_guests", to: 'users#event_guests'

  #given eventID, get all users hosting the event, return an array of otheruser
  get "/event_hosts", to:'users#event_hosts'

  #auto login gets all user details too
  get "/auto_login", to: "users#auto_login"

  #given search term, get all similar users, return an array of otheruser
  get "/users_search", to: 'users#index_for_search'
  
end
