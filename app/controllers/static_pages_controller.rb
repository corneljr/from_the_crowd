class StaticPagesController < ApplicationController
	layout 'static'
	skip_before_filter :require_login

	def home
	end

	def about
	end
	
end
