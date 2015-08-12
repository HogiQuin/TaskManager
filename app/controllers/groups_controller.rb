class GroupsController < ApplicationController
  before_action :require_user
  before_action :require_admin

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @students = User.where(:id => params[:students_groups])
    @group.users << @students
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
  @group = Group.find(params[:id])
  @students = User.where(:id => params[:students_groups])
  @group.users.destroy_all
  @group.users << @students
    if @group.update(group_params)
      redirect_to groups_path
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  private
    def group_params
      params.require(:group).permit(:name, :semester_id)
    end
end
