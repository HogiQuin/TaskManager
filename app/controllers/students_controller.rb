class StudentsController < ApplicationController
  before_action :require_user
  before_action :require_student

  def index
    @groups = current_user.groups
  end
  def my_group
    @groups = current_user.groups
  end

  def my_tasks
    @groups = current_user.groups
  end

  def my_courses
    @groups = current_user.groups
  end
end
