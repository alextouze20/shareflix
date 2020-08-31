class Api::V1::MessagesController < Api::V1::BaseController
  def create
    message = Message.new(message_params)
    authorize message
    message.user = current_user
    message.save!
  end

  def index
    @messages = policy_scope(Message)
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
