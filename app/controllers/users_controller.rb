class UsersController < ApplicationController
  before_action :require_user
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
    if @user.update(user_params)
      if current_user.student?
        redirect_to '/welcome'
      end
      if current_user.admin?
        redirect_to users_path
      end
      if current_user.instructor?
        redirect_to '/welcome_instructor'
      end
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:user_number, :first_name, :last_name, :password, :password_confirmation, :email, :phone, :role, :age)
    end
end
