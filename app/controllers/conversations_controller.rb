class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
    # only conversations with current user
  end

  def show
    # shwo one conversation selected/ on seperate page
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
    @new_message = Message.new
  end

  def new
    # start new conversation with someone
    @conversation = Conversation.new
  end

  def create
    # create a new conversation with someone/
    # should only validate when a message is created
    @sender = current_user
    @recipient = User.find(params[:recipient_id])
    @apartment = Apartment.find(params[:apartment_id])
    @conversation = Conversation.new(sender: @sender, recipient: @recipient, apartment: @apartment)
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      @conversation = current_user.conversations.where(recipient: @recipient).first
      redirect_to conversation_path(@conversation.id)
    end
    add_to_conversations
  end

  def close
    # destroy the conversation and all messages inside
    @conversation = Conversation.find(params[:id])
    @conversation.destroy
  end

  private

  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end

  def conversated?

    session[:conversations].include?(@conversation.id)

  end
end
