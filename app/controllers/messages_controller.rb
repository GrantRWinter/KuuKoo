class MessagesController < ApplicationController
  def index
  	@messages = Message.all
  end

  def show
  	@message = Message.where(id: params[:user_id])
  end

  def new
  	@message = @user.messages.build
  end

  def create
    @user = User.find(session[:user_id])
    @message = @user.messages.build(message_params)
  
    if @message.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Message Saved"
    else
      redirect_to @user, notice: "Message Not! Saved"
    end
  
  end

  def edit
    @message = Message.new(message_params)
  end

  protected

  def message_params
    params.require(:message).permit(:user_id, :subject, :recipient, :recipient_email, :recipient_phone_number, :send_time, :text, :created_at, :updated_at)
  end

end
