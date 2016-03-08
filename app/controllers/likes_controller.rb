class LikesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_tweet

	def create
		@tweet.likeswhere(user_id: current_user.id).first_or_create

		respond_to do |format|
			format.html{redirect_to request.referrer}
		end
	end

	def destroy
		@tweet.likes.where(user_id: current_user.id).destroy_all
		respond_to do |format|
			format.html{redirect_to request.referrer}
		end
	end
	
	private
	
	def set_tweet
		@tweet = Tweet.find(params[:tweet_id])
	end


end
