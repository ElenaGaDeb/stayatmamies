class ProfilePolicy < ApplicationPolicy

  def create?
    record.user == user
  end

  def new?
    return true
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
