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
  resource :users
  # given userID, get all event user is hosting
  get "/host_events", to: "event#host_events"

  #given userID, get all of user's invites
  get "/guest_invites", to: "invites#guest_invites"

  #given userID, get all events user is invited to
  get "/guest_events", to: "event#guest_events"

  #given userID, get all freind model that has user as initiating user or recieving user
  get "/user_friends", to: "friends#user_friends"


  post "/login", to: "users#login"


  #given eventID and invitation status(bool), get all invited users of that invite status
  get "/event_guests", to: 'users#event_guests'

  #given eventID, get all users hosting the event
  get "/event_hosts", to:'users#event_hosts'


  #auto login gets all user details too
  get "/auto_login", to: "users#auto_login"

  
  #given search term, get all similar users
  get "/users_search", to: 'users#index_for_search'
  
end
