class LikesController < ApplicationController
	def create
		secret = Secret.find(params[:id])
		Like.create(user:current_user, secret:secret)
		redirect_to '/dashboard'
	end
	def destroy
		Like.find_by(user:current_user, secret: Secret.find(params[:id])).destroy
		redirect_to '/dashboard'
	end
end
