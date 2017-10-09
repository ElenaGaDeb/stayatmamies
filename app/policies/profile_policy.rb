class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def create?
      record.user == user
    end

    def show?
      return true
    end

    def update?
      record.user == user
    end

    def index?
      return true
    end

    def destroy?
      record.user == user
    end

  end
end
