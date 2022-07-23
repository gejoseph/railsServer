class Host < ApplicationRecord
  belongs_to :user
  belongs_to :event

  #Scopes
  scope :by_user, -> (user_id) { where('user_id = ?',user_id) }
  scope :by_event, -> (event_id) { where('event_id = ?',event_id) }

  #Method
  def self.is_a_host(event_id,user_id)
    (Host.where(:user_id => user_id, :event_id => event_id)).length()>0
  end
end
