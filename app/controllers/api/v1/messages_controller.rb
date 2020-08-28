class Api::V1::MessagesController < Api::V1::BaseController
  def create
    p "bojour"
  end

  def index
    @messages = policy_scope(Messages)
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom)
  end
end
