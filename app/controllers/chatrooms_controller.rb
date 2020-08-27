class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom)
    @message = Message.new
    respond_to do |format|
      format.html
      format.json { render json: { chatroom: @chatroom } }
    end
  end
end
