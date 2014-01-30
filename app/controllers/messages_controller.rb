class MessagesController < ApplicationController
  def index
  	@messages = Message.all
  end

  def show
  	#@message = Message.where(id: params[:user_id])
  end

  def new
    @message = Message.new
  	@message = @user.messages.build
  end

  def create
    @message.user_id = current_user.id
    @message = Message.new(message_params, user_params)
    if @message.save
      session[:user_id] = @user.id
      redirect_to user_messages_path(@user), notice: "Message Saved"
    else
      redirect_to user_messages_path(@user), notice: "Message Not! Saved"
    end
  
  end

  def edit
    @message = Message.new(message_params)
  end

  protected

  def user_params
    params.require(:user).permit(:first_name, :last_name, :id, :email, :phone_number, :password)
  end

  def message_params
    params.require(:message).permit(:user_id, :subject, :recipient, :recipient_email, :recipient_phone_number, :send_time, :text, :created_at, :updated_at)
  end

end