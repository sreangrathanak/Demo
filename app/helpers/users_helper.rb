module UsersHelper
# Define method to return the image that take from Gravtar by following user
#And with default size of image =80 if user not input something else
def gravatar_for(user, options={size:80})
	#declare variable gravatar_id to get user email in downcase
	gravatar_id=Digest::MD5::hexdigest(user.email.downcase)
	#declare size variable with init from hash options
	size=options[:size]
	#declare variable gravatar_url to store link for user image with its size in gravatar by their email
	gravatar_url="https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
	#return image which get from the link of gravatar above and if link error show the user name also set some style to the image
	image_tag(gravatar_url,alt: user.name, class:"gravatar")
end
end
