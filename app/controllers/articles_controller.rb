class ArticlesController < ApplicationController
	skip_before_filter :require_login, only: [:index, :show]

	def index
		@articles = if params[:tag]
  	  	Article.where(post_status: 'post').tagged_with(params[:tag])
	  else
	    	Article.highest_weight.where(post_status: 'post')
	  end.order('created_at DESC').page(params[:page])

	  @recent_articles = Article.most_recent
	  @most_discussed = Article.discussed

	  respond_to do |format|
    	format.js
    	format.html
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
		@average = @article.votes.average(:quality).to_i
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
		params.require(:article).permit(:title, :body, :user_id, :image, :tag_list, :post_status)
	end
end
