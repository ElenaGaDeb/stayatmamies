class ConversationsController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @users = User.all.where.not(id: current_user)
    @conversations = policy_scope(Conversation)
    authorize(@conversations)
    @conversation = Conversation.find(params[:id])
  end

  def new
  end

  def create
    @conversation = Conversation.get(current_user.id, params[:user_id])
    authorize(@conversation)
    add_to_conversations

    respond_to do |format|
      format.html {redirect_to conversation_path(current_user.conversations.last)}
      format.js
    end
  end

  def close
     @conversation = Conversation.find(params[:id])

    session[:conversations].delete(@conversation.id)

    respond_to do |format|
      format.js
    end
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
