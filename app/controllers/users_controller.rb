class UsersController < ApplicationController
	before_action :correct_user, only: [:edit, :update]
  def show
  	  @user = User.find(params[:id])
  	  @books = @user.books
  	  @book = Book.new
  end

  def index
  	@users = User.all
  	@book = Book.new
  	@books = Book.all
  	@user =current_user
 end

 def edit
 end
 def update
 	if @user.update(user_params)
 	   redirect_to user_path(@user.id)
 	else
 		render :edit
    end
 end

 private
 def user_params
 	params.require(:user).permit(:name, :profile_image, :introduction)
 end

 def correct_user
 	@user = User.find(params[:id])
 	redirect_to(user_path(current_user)) unless @user == current_user
 end


end
