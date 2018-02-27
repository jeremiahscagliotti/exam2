class SongsController < ApplicationController
  def new
  	@user = User.find(session[:user_id])
  	@songs = Song.all
  end

  def create
  	@song = Song.create(title: params[:title], artist: params[:artist], user_id: session[:user_id])
    puts @song

  	if @song
  		redirect_to :back
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to :back
  	end

  end

  def add
  	Add.create(user_id: session[:user_id], song_id: params[:id])
  end

  def show
  	@song = Song.find(params[:id])
  	@users = Add.joins(:user).where(song_id: params[:id]).group(:user_id)
  end
end
