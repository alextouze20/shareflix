class Api::V1::ChatroomsController < Api::V1::BaseController

  def index
    @chatrooms = policy_scope(Chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize(@chatroom)
  end
end
