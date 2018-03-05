class CommentController < ApplicationController
	def new
		@comment=Comment.new(comments_params)
		@comment.save
		@question=Question.find(params[:id])
		redirect_to @question
	end

	private
		def comments_params
			params.require(:comment).permit(:question_id, :content, :commenter, :reply_to)
		end

end
