class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def new?
      user.profile.profile_type == 'student'
    end

    def create?
      user.profile.profile_type == 'student'
    end

    def show?
      user.profile.profile_type == 'host'
      user.profile.profile_type == 'student'
    end

  end
end
