class User < ApplicationRecord
    has_secure_password

    has_many :hosts, dependent: :destroy
    has_many :invites, dependent: :destroy
    has_many :events, through: :invites
    has_many :events, through: :hosts

    # has_many :hostedEvents, class_name: 'Event', foreign_key: ''
    

    has_many :initiatedFriendships, class_name: 'Friend', foreign_key: 'user1_id', dependent: :destroy
    has_many :recievedFriendships, class_name: 'Friend', foreign_key: 'user2_id',dependent: :destroy

    #Scopes
    scope :alphabetical, -> { order('username') }
    scope :search, -> (term){where('username LIKE ?', "%#{term}%")}
    scope :for_hosting, ->(event_id) {joins(:hosts).where('hosts.event_id = ?', event_id)}
    scope :for_invited, ->(event_id, invite_status) {joins(:invites).where('invites.event_id = ? AND invites.inviteStatus=?', event_id, invite_status)}
    scope :checked_in, ->{joins(:invites).where('invites.checkinTime IS NOT NULL')}
    scope :not_checked_in, ->{joins(:invites).where('invites.checkinTime IS NULL')}
    scope :initiated_friendship , ->(user_id, accepted) {joins(:recievedFriendships).where('friends.user1_id = ? AND friends.accepted = ?',user_id, accepted)}
    scope :recieved_friendship , ->(user_id, accepted) {joins(:initiatedFriendships).where('friends.user2_id = ? AND friends.accepted = ?',user_id, accepted)}
    
    #Methods

end
