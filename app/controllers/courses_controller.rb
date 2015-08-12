class CoursesController < ApplicationController
  before_action :require_user
  before_action :require_admin

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @groups = Group.where(:id => params[:courses_groups])
    @course.groups << @groups
    @users = User.where(:id => params[:courses_users])
    @course.users << @users
    if @course.save
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
  @course = Course.find(params[:id])
  @groups = Group.where(:id => params[:courses_groups])
  @course.groups.destroy_all
  @course.groups << @groups
  @users = User.where(:id => params[:courses_users])
  @course.users.destroy_all
  @course.users << @users
    if @course.update(course_params)
      redirect_to courses_path
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  private
    def course_params
      params.require(:course).permit(:name, :semester_id)
    end
end
