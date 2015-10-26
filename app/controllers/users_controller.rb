class UsersController < ApplicationController

	def new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = params[:user_id]
		flash[:notice] = "Welcome to the site!"
		redirect_to articles_path
		else
		flash[:alert] = "There was a problem creating your account. Please try again."
		redirect_to :back
		end
	end


private
	def user_params
		params.require(:user).permit(:username, :password)
	end
end
