class UserpageController < ApplicationController
	before_action :authenticate_user!
	def show
		@user=current_user
		@questions=Question.where(asker: @user.email)
		@comments=Comment.where(commenter: @user.email)
	end

	def info
		@user=current_user
	end

	def show_another
		@user=current_user
		@user_by_email=User.find_by(:email => (params[:email]+".com") )
		@questions=Question.where(asker: @user_by_email.email)
		@comments=Comment.where(commenter: @user_by_email.email)
	end 

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

end
