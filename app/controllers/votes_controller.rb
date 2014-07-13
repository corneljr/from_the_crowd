class VotesController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		@vote = @article.votes.build(vote_params)
		@vote.user_id = current_user.id
		@vote.save
		@average = @article.votes.average(:quality).to_i

		if @article.destroy?
			@article.destroy
			redirect_to articles_path, notice: 'Article has been archived'
		end
	end

	private

	def vote_params
		params.require(:vote).permit(:quality)
	end
end
