module UsersHelper
# Define method to return the image that take from Gravtar by following user
def gravatar_for(user)
	#declare variable gravatar_id to get user email in downcase
	gravatar_id=Digest::MD5::hexdigest(user.email.downcase)
	#declare variable gravatar_url to store link for user image in gravatar by their email
	gravatar_url="https://secure.gravatar.com/avatar/#{gravatar_id}"
	#return image which get from the link of gravatar above and if link error show the user name also set some style to the image
	image_tag(gravatar_url,alt: user.name, class:"gravatar")
end
end
