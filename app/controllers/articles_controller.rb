class ArticlesController < ApplicationController
	def index
			@articles = Article.all
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to articles_path
		else
			render "new"
		end
		
	end

	def show
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update_attributes(article_params)
		redirect_to article_path(@article)
	end

	def edit
		@article = Article.find(params[:id])
	end

	def delete
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private

	def article_params
		params.require(:article).permit(:title, :body, :user_id)
	end
end
