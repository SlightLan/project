class StarController < ApplicationController
	def star_question
		@question=Question.find_by(:id => params[:question])
		@question.stars += 1
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
