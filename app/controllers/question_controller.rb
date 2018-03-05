class QuestionController < ApplicationController
	before_action :authenticate_user!
	def index
		@questions= Question.all
	end

	def show
		@reply_to
		@user = current_user
		@question=Question.find(params[:id])
		@comments=Comment.where(question_id: params[:id])

	end

	def create
	end

	def new
		@question=Question.new(question_params)
		@question.save
		redirect_to @question
	end

	private
		def question_params
			params.require(:question).permit(:title, :content, :asker)
		end
end
