module SessionsHelper
	# define method to put user id in hash sessin
	def sign_in user
		#declare hash table to get user id
		session[:user_id]=user.id
	end
	#define method to return the current user from table user finf by id if the current user is empty
	def current_user
		@current_user ||=User.find_by(id: session[:user_id])
	end
	#define method to return true if user is sign in or else return false
	def signed_in?
		#return the bolean of current user
		!current_user.nil?
	end
	#define method to unlock some data like id and current user
	def sign_out
		#delete user id from hash table
		session.delete(:user_id)
		#set current user to nil
		@current_user=nil
	end
	#define method to return true if the given user is the current user.
	def current_user? user
		user==current_user		
	end
end
