class TasksController < ApplicationController
  before_action :require_user
  before_action :require_instructor
  
  def index
    @courses = current_user.courses
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @groups = Group.where(:id => params[:groups_tasks])
    @task.groups << @groups
    if @task.save
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
  @task = Task.find(params[:id])
  @groups = Group.where(:id => params[:groups_tasks])
  @task.groups.destroy_all
  @task.groups << @groups
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:title, :description, :date_to_deliver, :course_id)
    end
end
