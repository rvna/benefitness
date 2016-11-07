class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:session][:email])
    
    if @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
    end

    redirect_to root_path
  end
end