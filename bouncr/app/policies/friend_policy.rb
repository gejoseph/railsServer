class FriendPolicy < ApplicationPolicy
    def create?
        user.is_admin? or record.is_involved(user.id)
    end

    def update?
      user.is_admin? or record.is_involved(user.id)
    end

    def destroy?
        user.is_admin? or record.is_involved(user.id)
    end

    def show?
      user.is_admin? or record.is_involved(user.id)
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