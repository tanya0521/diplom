class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  ## Эти методы надо показывать всем
  skip_before_action :check_app_auth
  
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember])
      redirect_back_or_to(root_path(), notice: 'Авторизация успешна')
    else
      flash.now[:alert] = 'Авторизация не удалась'
      render action: 'new'
    end    
  end

  def destroy
    logout
    redirect_to(login_path(), notice: 'выйти!')    
  end
end

