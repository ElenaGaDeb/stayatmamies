class ApartmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
    def create?
      record.user == user && user.profile.profile_type == 'host'
    end

    def new?
      user.profile.profile_type == 'host' && user.apartment == nil

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
