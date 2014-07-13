class ArticlesController < ApplicationController
	skip_before_filter :require_login, only: [:index, :show]

	def index
		if params[:tag]
  	  	@articles = Article.tagged_with(params[:tag])
	  else
	    @articles = Article.highest_weight
	  end
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user_id = current_user.id

		if @article.save
			redirect_to articles_path
		else
			render "new"
		end
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comments = @article.comments.order('created_at ASC')
		@vote = Vote.new
		@voted = @article.user_voted(current_user)
	end

	def update
		@article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private

	def article_params
		params.require(:article).permit(:title, :body, :user_id, :image, :tag_list)
	end
end
