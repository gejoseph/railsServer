class InvitePolicy < ApplicationPolicy
    def update?
        user.is_admin? or Host.is_a_host(record.event_id,user.id) 
    end

    def destroy?
        user.is_admin? or Host.is_a_host(record.event_id,user.id) 
    end

    def create?
        user.is_admin? or Host.is_a_host(record.event_id,user.id) 
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