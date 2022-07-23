class UserPolicy < ApplicationPolicy
    # Here we are overriding :update? inherited from ApplicationPolicy
    def update?
      user.is_admin? or record.id==user.id
    end

    def show?
      user.is_admin? or record.id==user.id
    end 

    def index_friends?
      user.is_admin? or record.id==user.id
    end 

    def index_friend_requests?
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