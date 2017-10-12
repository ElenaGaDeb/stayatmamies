class MessagesController < ApplicationController
  before_action :authenticate_user!

  # def new
  # end

  def create
    @conversation = Conversation.find(params[:conversation_id])


    @message  = Message.new(message_params)
    set_sender
    @message.conversation = @conversation
    @message.user = current_user
    if @message.save
      ActionCable.server.broadcast "notifications_#{current_user.id}_channel",
        content:  @message.content,
        by_user_id: @message.by_user_id,
        conversation_id: @message.conversation_id
      ActionCable.server.broadcast "notifications_#{@message.for_user.id}_channel",
        content:  @message.content,
        by_user_id: @message.by_user_id,
        conversation_id: @message.conversation_id
      respond_to do |format|
        format.html { redirect_to conversation_path(@conversation) }
        format.js  # <-- will render `app/views/messages/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'conversation/show' }
        format.js  # <-- idem
      end
    end


  end


  #   authorize(@message)

  private

  def set_sender
    if @conversation.sender == current_user
      @message.by_user = current_user
      @message.for_user = @conversation.recipient
    else
      @message.by_user = current_user
      @message.for_user = @conversation.sender
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end

end
