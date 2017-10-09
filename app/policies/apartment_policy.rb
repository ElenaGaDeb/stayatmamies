class ApartmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
    def create?
      record.user == user && user.profile_type == 'host'
    end

    def show?
      return true
    end

    def edit?
      record.user == user
    end

    def update?
      record.user == user
    end

    def destroy?
      record.user == user
    end
end
