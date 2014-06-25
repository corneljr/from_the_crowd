class CommentsController < ApplicationController
	before_filter :require_login

	def create
		@comment = Comment.new
	end

	def delete
		@comment = Comment.find(params[:id])
		@article = @comment.article
		@comment.destory
		redirect_to article_path(@article)
	end

end
