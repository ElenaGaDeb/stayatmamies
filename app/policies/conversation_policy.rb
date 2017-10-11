class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where('sender_id=? OR recipient_id=?', user.id, user.id)
    end
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def destroy?
    record.user == user
  end


end
