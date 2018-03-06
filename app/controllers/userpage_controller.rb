class UserpageController < ApplicationController
	def show
		@user=current_user
		@questions=Question.where(asker: @user.email)
		@comments=Comment.where(commenter: @user.email)
	end

	def info
		@user=current_user
	end
	def user_params
		params.require(:user).permit(:name, :email, :password,
																 :password_confirmation)
	end
end
