class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:chatroom_users).where(chatroom_users: { user_id: user.id })
    end
  end

  def show?
    true
  end
end
