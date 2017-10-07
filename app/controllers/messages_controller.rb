class MessagesController < ApplicationController
  before_action :logged_in_user
  before_action :get_messages

  def new
  end

  def create
    @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    if @message.save
      ActionCable.server.broadcast "conversation_#{@conversation.id}_channel",
                                   content:  @message.content,
                                   user_id: @message.user_id,
                                   conversation_id: @message.conversation_id
    end
    authorize(@message)

    respond_to do |format|
      format.js
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content)
  end

end
