class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :event
  #after_initialize :init
  
  #Scope
  scope :by_user, -> (user_id) { where('user_id = ?',user_id) }
  scope :by_event, -> (event_id) { where('event_id = ?',event_id) }
  scope :checkedIn, -> {where('checkinTime IS NOT NULL')}
  scope :accepted, -> { where('inviteStatus = ?',true) }

  #set default values 
  # def init
  #   self.inviteStatus = false
  #   self.coverChargePaid = 0.0
  # end
  def self.is_a_guest(event_id,user_id)
    (Invite.where(:user_id => user_id, :event_id => event_id)).length()>0
  end
end
