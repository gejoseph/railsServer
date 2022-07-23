class EventPolicy < ApplicationPolicy
    def event_hosts?
      user.is_admin? or Host.is_a_host(record.id,user.id) or Invite.is_a_guest(record.id,user.id)
    end

    def event_guests?
    user.is_admin? or Host.is_a_host(record.id,user.id) or Invite.is_a_guest(record.id,user.id)
    end

    class Scope < Scope
      def resolve
        if user.is_admin?
          scope.all
        else
          []
        end
      end
    end

  end