class UsersController < ApplicationController
	#before_filter :authorize ,only: [:new] 
	def new
		@user=User.new
	end

	def create
		@user=User.new(user_params)
		if @user.save
			
			flash[:notice]="Thank you for siging up" 
			redirect_to new_session_path
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:email,:password,:confirm_password)
	end
end
