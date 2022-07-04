class Event < ApplicationRecord
    has_many :hosts, dependent: :destroy
    has_many :invites, dependent: :destroy
    has_many :organization_events, dependent: :destroy
    has_many :users, through: :hosts
    has_many :users, through: :invites
    has_many :organizations, through: :organization_events

    #Scopes
    scope :alphabetical, -> { order('name') }
    scope :forHost, -> (host_id) { joins(:hosts).where('hosts.user_id = ?',host_id) }
    scope :forGuest, -> (guest_id) { joins(:invites).where('invites.user_id = ?',guest_id) }
    scope :current, -> { where(["startTime <= ? AND endTime >= ?", t = DateTime.now, t]) }
    scope :past, -> { where("endTime < ?",  DateTime.now) }
    scope :future, -> { where("startTime > ?", DateTime.now) }

    #Methods

end
