class QuestionController < ApplicationController
	before_action :authenticate_user!
	def index
		@user = current_user
		@questions= Question.all
		@populars= Question.limit(5).all.order(stars: :desc)
	end

	def show
		@reply_to
		@user=current_user
		@question=Question.find(params[:id])
		#@question=Question.find(all,:conditions => [asker = ss])
		@comments=Comment.where(question_id: params[:id])
	end

	def create
		@user=current_user
	end

	def new
		@question=Question.new(question_params)
		@question.save
		@user=current_user
		@user.question_num += 1
		@user.save
		redirect_to @question
	end

	private
		def question_params
			params.require(:question).permit(:title, :content, :asker)
		end
end
