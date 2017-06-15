class SecretsController < ApplicationController
	def create
	secret = Secret.create(secret_params.merge(user:current_user))
		if secret.valid?
			redirect_to '/dashboard'
		else
			flash[:secret_errors] = secret.errors.full_messages.first
			redirect_to "/users/#{current_user.id}"
		end
	end
	def destroy
		Secret.destroy(params[:id])
		redirect_to '/dashboard'
	end
	private
		def secret_params
			params.require(:secret).permit(:content)
		end
end
