class QuestionController < ApplicationController

	def index
		@questions= Question.all
	end

	def show
		@question=Question.find(params[:id])
		@comments=Comment.where(question_id: params[:id])
	end

	def create
		
	end

	def new
		@question=Question.new(question_params)
		@question.save
		redirect_to index_question_path
	end

	private
		def question_params
			params.require(:question).permit(:title, :content, :asker)
		end
end
