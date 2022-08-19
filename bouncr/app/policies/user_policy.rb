class UserPolicy < ApplicationPolicy
    # Here we are overriding :update? inherited from ApplicationPolicy
    def update?
      user.is_admin? or record.id==user.id
    end

    def show?
      is_admin_or_self?
    end 

    def index_friends?
      is_admin_or_self?
    end 

    def index_friend_requests?
      is_admin_or_self?
    end 

    def create_with_host?
      is_admin_or_self?
    end

    def host_events?
      is_admin_or_self?
    end

    def guest_invites?
      is_admin_or_self?
    end

    def is_admin_or_self?
      user.is_admin? or record.id==user.id
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