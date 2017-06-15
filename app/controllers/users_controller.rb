class UsersController < ApplicationController	
	before_action :user_authorized, only:[:dashboard, :show]
	before_action :logged_in, only:[:index]
	def index
	end
	def create
		user = User.create(user_params)
		if user.valid?
			session[:user_id] = user.id
			redirect_to '/dashboard'
		else
			flash[:reg_errors] = user.errors.full_messages
			redirect_to '/'
		end
	end
	def dashboard
		@current_user= current_user
		@secrets = Secret.all.includes(:likes, :user)
		@likes = @current_user.secrets_liked_ids
	end
	def show
		@current_user = current_user
		@liked_secrets = @current_user.secrets_liked.includes(:likes)
	end
	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
