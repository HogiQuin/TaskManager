class InstructorsController < ApplicationController
  before_action :require_user
  before_action :require_instructor

  def index
  end

  def my_courses_instructor
    @courses = current_user.courses
  end

  def my_groups_instructor
    @courses = current_user.courses
  end
end
