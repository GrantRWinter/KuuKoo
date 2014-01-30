class MessagesController < ApplicationController
  def index
  	@messages = Message.all
  end

  def show
  	#@message = Message.where(id: params[:user_id])
  end

  def new
  	@message = @user.messages.build
  end

  def edit
  	@message = Message.new(message_params)
  end

  def create
    
  end

  protected

  def user_params
    params.require(:user).permit(:first_name, :last_name, :id, :email, :phone_number, :password)
  end

end
