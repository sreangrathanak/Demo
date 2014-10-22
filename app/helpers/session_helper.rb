module SessionHelper
#Logs in the given user.
def sign_in(user)
	#declare and init hash session with user id
	session[:user_id]=user.id
end
#Return the current signed in user
def current_user
	#declare variable current_user and initialize with user recode which find by id that apply in sing_in method above
	#if the current_user have data already do not init
	@current_user ||=User.find_by(id: session[:user_id])
end
end
