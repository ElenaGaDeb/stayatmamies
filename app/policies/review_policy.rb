class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def index?
      return true
    end

    def show?
      return true
    end

    def new?
      (user.profile.profile_type == 'student' && @apartment.user.profile.profile_type == 'host')
      ||
      (current_user.profile.profile_type == 'host' @profile.profile_type == 'student')
    end

    def create?
      user.profile.profile_type == 'student' && @apartment.user.profile.profile_type == 'host'
    end
  end
end
