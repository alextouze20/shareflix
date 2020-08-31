class ReportPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin ? scope.all : []
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end
end
