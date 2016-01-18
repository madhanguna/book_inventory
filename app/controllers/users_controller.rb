class UsersController < ApplicationController
	
	before_filter :authorize ,only: [:edit,:update,:create,:destroy,:index]

	def new
		@user=User.new
	end

	def index
		@user=User.all
	end

	def show
		@user=User.find(params[:id])
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

	def destroy
		@user=User.find(params[:id])
		@user.destroy
		redirect_to @user
	end

	private
	def user_params
		params.require(:user).permit(:email,:password,:confirm_password)
	end
end
