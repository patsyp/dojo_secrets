class SessionsController < ApplicationController
	def create
		user = User.find_by(email: log_params[:email])
		if user && user.authenticate(log_params[:password])
			session[:user_id] = user.id
			redirect_to '/dashboard'
		else
			flash[:log_errors]= 'Invalid credentials'
			redirect_to '/'
		end
	end

	def destroy
		reset_session
		redirect_to '/'
	end
	private
	def log_params
		params.require(:session).permit(:email, :password)
	end
end
