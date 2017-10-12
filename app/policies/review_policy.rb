class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    #    (user.profile.profile_type == 'student' && User.find(record.for_user_id).profile.profile_type == 'host') || (user.profile.profile_type == 'host' && User.find(record.for_user_id).profile.profile_type == 'student')
      if user.profile.profile_type == 'student'
        return user.bookings.map { |b| Apartment.find(b.apartment_id).user_id }.include?(record.for_user_id)
      else
        return user.apartment.bookings.map { |b| b.user_id }.include?(record.for_user_id)
      end
  end
end
