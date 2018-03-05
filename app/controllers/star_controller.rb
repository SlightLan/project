class StarController < ApplicationController
	def star_question
		@question=Question.find_by(:id => params[:id])
		@question.stars += 1
		@question.save
		redirect_to @question
	end

	def star_comment
		redirect_to question_path(:id => params[:id])
	end
end
