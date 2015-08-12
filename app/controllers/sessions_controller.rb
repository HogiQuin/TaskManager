class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by_user_number(params[:session][:user_number])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.role == 'student'
        redirect_to '/welcome'
      end
      if @user.role == 'admin'
        redirect_to '/welcome_admin'
      end
      if @user.role == 'instructor'
        redirect_to '/welcome_instructor'
      end
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
