class RelationshipsController < ApplicationController
#set some permission before you do any action on this controll
before_action :signed_in_user
#action create
def create
	#declare user variable to get the user data from User table by find from their id
	@user = User.find(params[:followed_id])
	#add current user to follow the user we just call above
    current_user.follow(@user)
    #link to that user
    #redirect_to user
    #by use javascript code , which use to link to user page and execut data without refreshing page
    respond_to do |format|
    	format.html{redirect_to @user}
    	format.js
    end
end
#action destroy
def destroy
	#declare user variable to get the user data from User table by find from their id
	@user = Relationship.find(params[:id]).followed
	#user from follow the current user 
    current_user.unfollow(@user)
    #link to that user
    #redirect_to user
    #by use javascript code , which use to link to user page and execut data without refreshing page
    respond_to do |format|
    	format.html{redirect_to @user}
    	format.js
    end
end
end
