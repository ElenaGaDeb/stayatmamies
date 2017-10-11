class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

    def index?
      return true
    end

    def show?
      return true
    end

    def new?
      (user.profile.profile_type == 'student' && @apartment.user.profile.profile_type == 'host') || (user.profile.profile_type == 'host' && @profile.profile_type == 'student')
    end

    def create?
      if @apartment != nil
      return user.profile.profile_type == 'student' && @apartment.user.profile.profile_type == 'host'
      else
      return user.profile.profile_type == 'host' && Profile.find(record.for_user_id).profile_type == 'student'
    end
    end
end
