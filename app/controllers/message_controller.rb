class MessageController < ApplicationController
  def index
  	@messages = Message.all
  end

  def show
  	@message = Message.where(id: params[:user_id])
  end

  def new
  	@message = Message.new
  end

  def edit
  	@message = Message.new(message_params)
  end


end
