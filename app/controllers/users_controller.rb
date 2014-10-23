class UsersController < ApplicationController
  #put some permision before some action
  # add  ":following,:followers" if don't want non-sign user can view our follower following
  before_action :signed_in_user, only:[:edit,:update, :destroy]
  #before_action :correct_user, only:[:edit,:update, :destroy]
  #to set only user admin can remove other user other current user cannot just remove comment under
  #before_action :admin_user,     only: :destroy
  #action new user
  def new
  	#declare user variabel with assign new user
  	@user=User.new
  end
  #action index
  def index
    #get user all and show in slide bar
    @users=User.paginate(page: params[:page])
  end
  #action show user
  def show
  	#assign variable @user from  User table find by the id come from params method
  	#the variable user can be use any where
  	@user=User.find(params[:id])
    #show the user entries
    @entries = @user.entries.paginate(page: params[:page])
  	#use to see what is going on on my App by using debuger method
  	#debugger
  end
  #action create user
  def create
  	#declear user variale to get new user from methos user_params which body at down bottom
  	@user = User.new(user_params)
  	#if user is saved successful.
  	if @user.save
      #call methods from session helper to get the @user id
      sign_in @user
  		# use flash method to store message with it key 
  		flash[:success]="Welcome to the Demo App!"
  		# redirect to user url
  		redirect_to @user
  	else #if not go to file app/view/users/new.html.erb new page again
  		render 'new'
  	end
  end
  #action edit
  def edit
    #declare user and init from table User find by id in params
    @user=User.find(params[:id])
  end
  #action update
  def update
    @user=User.find(params[:id])
    # if user can update its attribute from methos user_params which body at down bottom
    if @user.update_attributes(user_params)
      #show message about successful edit
      flash[:success]="Profile update"
      #link to user page 
      redirect_to @user
    else
      render 'edit'
    end
  end
  #action destroy
  def destroy
    #find user by id and destroy
    User.find(params[:id]).destroy
    #show message about destroy
    flash[:success] = "User deleted"
    #reload link to all user
    redirect_to users_url
  end
  #define method following
  def following
    #declare variable for title
    @title="Following"
    #declare variable for get user data from table User
    @user=User.find(params[:id])
    #declare variable for store all user that following
    @users=@user.following.paginate(page: params[:page])
    #load file at app/view/user/_show_follow.html.erb
    render 'show_follow'
  end
  #define method follower
  def followers
    #declare variable for title
    @title="Followers"
    #declare variable for get user data from table User
    @user=User.find(params[:id])
    #declare variable for store all user who are follow you
    @users=@user.followers.paginate(page: params[:page])
    #load file at app/view/user/_show_follow.html.erb
    render 'show_follow'
  end
  #private section
  private
  #define methods user_params
  def user_params
  	#return  the user with the permit variable 
  	params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  #define method to confirme that user is signed in
  def signed_in_user
    #call and check on method signed_in from session helper if not user login
    unless signed_in?
      #show message to the user
      flash[:danger]="Please sign in"
      #link to sign in page
      redirect_to signin_url
    end
  end
  #define method to comfirme that user is correct
  def correct_user
    @user=User.find(params[:id])
    #return to root if user !=current user
    redirect_to(root_url) unless current_user?(@user)
  end
end
