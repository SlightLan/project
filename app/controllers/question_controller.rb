class QuestionController < ApplicationController

	def index
		@questions= Question.all
	end

	def create
		@questions=Question.new(params[:question])
	end
	def new
		render plain: params[:question].inspect
	end
end
