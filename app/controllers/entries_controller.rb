class EntriesController < ApplicationController
	#declare to check vefore any action happen
	before_action :signed_in_user, only: [:create,:destroy]
	before_action :correct_user, only: :destroy
#create nem entries action
def create
	#declare variable to get entries from current user entries
	@entry=current_user.entries.build(entry_params)
	#if save success
	if @entry.save
		#show message to user
		flash[:success]="Entry create"
		#link to root path
		redirect_to root_url
	else #else
		#reset feed to empty
		@feed_items=[]
		#link to home page
		render 'home_pages/home'
	end
end
#delete action
def destroy
	#delete the entry
	@entry.destroy
	#show message to the user
	flash[:success]="Entry deleted"
	#link user  or else root path
	redirect_to request.referrer || root_url
end
#action show entry
def show
	#
	@entry=Entry.find(params[:id])
    #show the user entries
    @comments = @entry.comments.paginate(page: params[:page])
end

#private sestion
private
#define method to return new entry
def entry_params
	#return params of entry with following tile body and date
	params.require(:entry).permit(:title,:body)
end
#define method to check is the user is post that entry or not
def correct_user
	#declare entry variable to get user post the entry 
      @entry = current_user.entries.find_by(id: params[:id])
      #if entry is nil link to root path
      redirect_to root_url if @entry.nil?
    end
end
