class HomePagesController < ApplicationController
  def home
    if signed_in?
  	 #declare and assign value to enty variable with method for current user from entry controller
  	 @entry=current_user.entries.build 
      #declare and assign value to feed items from current user entries into slide page
      @feed_items=current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end
  def contact
  end
end
