class User < ActiveRecord::Base
#relationship with model Entry
# dependent: :destroy arranges for the dependent microposts to be destroyed when the user itself is destroyed
has_many :entries, dependent: :destroy
#make the relationship  betwwen user by using follwer as key
has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
#make the relationship  betwwen user by using follwer as key
has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent: :destroy
#make a relationships for following
has_many :following, through: :active_relationships, source: :followed
#make a relationships for following
has_many :followers, through: :passive_relationships, source: :follower
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
#also allow blank
validates :password, length:{minimum: 6}, allow_blank: true

# define method to return the hash digest of the given string
def User.digest(string)
	#declare cost variable to get cost from BCrypt
	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
	#cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :BCrypt::Engine.cost
	#return password that convert from string given
	BCrypt::Password.create(string, cost: cost)
end
#define feed for user entry
def feed
	#This is will show all Entries of user
	#Entry.where("user_id= ?", id)
	Entry.from_users_followed_by(self)
end
# Follow a user
def  follow(other_user)
	#add data to table ralationship
	active_relationships.create(followed_id: other_user.id)
end
#unfollow a user
def unfollow(other_user)
	#find followed id in table in ralationship and delete
	active_relationships.find_by(followed_id: other_user.id).destroy
end
#return true if the current user is following the other user.
def following?(other_user)
	#check and return if they follow to other user already or not
	following.include?(other_user)
end
end
