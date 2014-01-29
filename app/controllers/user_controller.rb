class UserController < ApplicationController
  def index
  	@user = User.find(params[:id])
  	@message = Message.all
  end

  def show
  	@user = User.find(params[:id])
    @message = Message.where(user_id: params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		redirect_to user_path
  	else
  		render :new
  	end
  end

  protected

  def user_params
  	params.require(:user).permit(
  		:first_name, :last_name, :phone_number, :email
  		)
  end

end
