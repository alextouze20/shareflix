class UserPolicy < ApplicationPolicy
  def show?
    return true
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    record == user
  end

  def edit?
    record == user
  end

  def update?
    record == user
  end
end
