class StaticPagesController < ApplicationController
	layout 'static'
	skip_before_filter :require_login

	def home
		redirect_to articles_path if current_user
	end

	def about
	end
	
end
