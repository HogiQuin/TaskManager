class SemestersController < ApplicationController
  before_action :require_user
  before_action :require_admin

  def index
    @semesters = Semester.all
  end

  def new
    @semester = Semester.new
  end

  def create
    @semester = Semester.new(semester_params)
    if @semester.save
      redirect_to semesters_path
    else
      render 'new'
    end
  end

  def edit
    @semester = Semester.find(params[:id])
  end

  def update
  @semester = Semester.find(params[:id])
    if @semester.update(semester_params)
      redirect_to semesters_path
    else
      render 'edit'
    end
  end

  def destroy
    @semester = Semester.find(params[:id])
    @semester.destroy
    redirect_to semesters_path
  end

  private
    def semester_params
      params.require(:semester).permit(:name, :start_date, :end_date, :status)
    end
end
