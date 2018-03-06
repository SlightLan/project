class StarController < ApplicationController
	def star_question
		@user=current_user
		@question=Question.find_by(:id => params[:question])
		if not @question.stars_list.include? @user.email
			@question.stars_list.insert(-1," "+@user.email)
			@question.stars += 1
		end
		@question.save
		redirect_to @question
	end

	def star_comment
		@comment=Comment.find_by(:id => params[:comment])
		@comment.stars += 1
		@comment.save
		@question=Question.find_by(:id => params[:id])
		redirect_to @question
	end
end
