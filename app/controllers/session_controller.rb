class SessionController < ApplicationController
  def new
  end
  def create
  	#declare variable user from Table user that we find by email
  	user=User.find_by(email: params[:session][:email].downcase)
  	#if user is not empty and user password is match with the password field in session
  	if user && user.authenticate(params[:session][:password])
  		#call method sign_in from session helper to log user
  		sing_in user
  		# link to user page
  		redirect_to user
  	else #else
  		#show message to the user
  		flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
  		#load file in app/view/session/new.html.erb
  		render 'new'
  	end
  end
end
