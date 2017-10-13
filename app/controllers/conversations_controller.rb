class ConversationsController < ApplicationController
  before_action :authenticate_user!

  include Pundit
  after_action :verify_authorized
   # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @conversations = policy_scope(Conversation)
    authorize(@conversations)
    # @conversations = policy_scope
    # only conversations with current user

  end

  def show
    # shwo one conversation selected/ on seperate page
    @conversation = Conversation.find(params[:id])
    authorize(@conversation)
    get_oppose_user(@conversation)
    @conversation.messages.where(read:false).each do |msg|
      if msg.for_user == current_user
        msg.read = true
        msg.save!
      end
    end

    # @messages = @conversation.messages
    @new_message = Message.new
  end
  def new
    if current_user.profile.nil?
      redirect_to new_profile_path
      flash[:alert] = "You mush have a profile"
    else
    # start new conversation with someone
      @conversation = Conversation.new
    end
  end
  def create
    # create a new conversation with someone/
    # should only validate when a message is created
    @sender = current_user
    @recipient = User.find(params[:recipient_id])
    @apartment = Apartment.find(params[:apartment_id])
    @conversation = Conversation.new(sender: @sender, recipient: @recipient, apartment: @apartment)
    authorize(@conversation)
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      @conversation = Conversation.get(current_user.id, params[:recipient_id])
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
  def get_oppose_user(conversation)
    @opposed_user = conversation.opposed_user(current_user)
  end
  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end
  def conversated?
    session[:conversations].include?(@conversation.id)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
