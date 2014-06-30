class UserSessionsController < ApplicationController
  skip_before_filter :require_login, only: [:destroy, :new, :create]

  def new
  end

  def create
  	if @user = login(params[:email], params[:password])
      session[:user_id] = @user.id
  		redirect_to articles_path, notice: 'Login successful'
  	else
  		flash.now[:alert] = 'Login failed'
  		render action: 'new'
  	end
  end

  def destroy
  	logout 
  	redirect_to(:users, notice: 'Logged out!')
  end
end
