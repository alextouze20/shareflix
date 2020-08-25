class PlatformAccountPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def destroy?
    user == record.user
  end

  def edit?
    user == record.user
  end

  def update?
    user == record.user
  end

  def new?
    true
  end

  def create?
    true
  end
end
