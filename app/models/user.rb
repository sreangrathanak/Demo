class User < ActiveRecord::Base
#user before_save callback to downcase user email before saving
before_save{email.downcase!}
# make sure field name in table User is not blank
#limit user name length to not longer than 59 character
validates :name, presence: true, length: {maximum:59}
#declare constant variable for hold the email correct format
VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
# make sure field email in table User is not blank
#limit user email length to not longer than 101 character
#put the format to user emails
#make sure email have only one in table and also with case sensitive
validates :email, presence: true, length: {maximum: 99},format:{with: VALID_EMAIL_REGEX},uniqueness: {case_sensitive: false}
#user to enforces validation on user_password and user_password_confirmation
has_secure_password
#limit the minimum 6 digits
validates :password, length:{minimum: 6}

# define method to return the hash digest of the given string
def User.digest(string)
	#declare cost variable to get cost from BCrypt
	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
	#cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :BCrypt::Engine.cost
	#return password that convert from string given
	BCrypt::Password.create(string, cost: cost)
end
end
