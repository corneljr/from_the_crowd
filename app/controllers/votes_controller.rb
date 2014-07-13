class VotesController < ApplicationController

	def create
		@article = Article.find(params[:article_id])

		if @article.user_voted(current_user)
			redirect_to @article, notice: 'You can only rate once!' 
		else
			@vote = @article.votes.build(vote_params)
			@vote.user_id = current_user.id
			@vote.save
			if destroy?(@article)
				@article.destroy
				redirect_to articles_path, notice: 'Article has been archived'
			else
				redirect_to @article, notice: 'Thanks for rating the article!'
			end
		end
	end

	private

	def vote_params
		params.require(:vote).permit(:quality)
	end
end
