class SessionsController < ApplicationController
  def new
  end
  #action when use press button Sign in
  def create
  	#declare user variable with init from table User by find from email from email field
  	user=User.find_by(email: params[:session][:email].downcase)
  	#if user in not nil and password match with password in table
  	if user && user.authenticate(params[:session][:password])
  		#call method for app/helper/ session_helper.rb to store user id
  		sign_in user
  		#link to user page
  		redirect_to user
  	else #else
  	flash.now[:danger]	='Invalid email/ password combination'
  	#load file at app/view/sessions/new.html.erb
  	render 'new'
  	end
  end
  def destroy
    #call method from app/helper/session_helper to release some data
    sign_out
    #link to root url
    redirect_to root_url
  end
end
