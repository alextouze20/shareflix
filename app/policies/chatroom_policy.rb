class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:chatroom_users).where(chatroom_users: { profile_id: user.id })
    end
  end

  def show?
    true
  end
end
