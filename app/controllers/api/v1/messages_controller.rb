class Api::V1::ChatroomsController < Api::V1::BaseController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    authorize @message
    @message.save!
  end

  def index
  end
  private

  def message_params
    params.require(:message).permit(:content, :chatroom)
  end
end
