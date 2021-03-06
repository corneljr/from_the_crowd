class CommentsController < ApplicationController
	include ActionController::Live

	before_action :load_article

	def create
		@comment = @article.comments.build(comment_params)
		@comment.user_id = current_user.id
		@comment.save
	end

	def delete
		@comment = Comment.find(params[:id])
		@article = @comment.article
		@comment.destory
		redirect_to article_path(@article)
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

	def load_article
    @article = Article.find(params[:article_id])
  end

end
