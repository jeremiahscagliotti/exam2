class UsersController < ApplicationController
  def new
  end

  def create
  	@user = User.new(user_params)
  	
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to "/songs/new"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to :back
  	end
  end

  def show
    @user = User.find(params[:id])
    @songs = Add.joins(:song).where(user_id: params[:id]).group(:song_id)
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end

end