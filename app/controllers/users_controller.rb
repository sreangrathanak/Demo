class UsersController < ApplicationController
  def new
  	#declare user variabel with assign new user
  	@user=User.new
  end
  def show
  	#assign variable @user from  User table find by the id come from params method
  	#the variable user can be use any where
  	@user=User.find(params[:id])
  	#use to see what is going on on my App by using debuger method
  	#debugger
  end
  #Define method for create user
  def create
  	#declear user variale to get new user from methos user_params
  	@user = User.new(user_params)
  	#if user is saved successful.
  	if @user.save
  		# use flash method to store message with it key 
  		flash[:success]="Welcome to the Demo App!"
  		# redirect to user url
  		redirect_to @user
  	else #if not go to file app/view/users/new.html.erb new page again
  		render 'new'
  	end
  end

  #private section
  private
  #define methods user_params
  def user_params
  	#return  the user with the permit variable 
  	params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
