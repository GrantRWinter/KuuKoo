class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    
    @user = User.new(user_params)
    
    
      if @user.save
        session[:user_id] = @user.id
        # redirect_to user_path(@user), notice: "Welcomed and Logged in"


        Mailer.welcome_email(@user).deliver

        format.html {redirect_to user_path(@user), notice: "Welcomed and Logged in"}
        
      else
        render :new
      end
    
    
  
  end


  def index
  	@user = User.new
  	@message = Message.all
  end

  def show
  	@user = User.find(params[:id])
    @message = Message.new
  end

  def custom_message
    @message = Message.all
  end

  protected

  def user_params
  	params.require(:user).permit(
  		:first_name, :last_name, :phone_number, :email, :password, :password_confirmation
  		)
  end

end