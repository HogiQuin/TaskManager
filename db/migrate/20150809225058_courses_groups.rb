class CoursesGroups < ActiveRecord::Migration
  def change
    create_table :courses_groups do |t|
     t.integer :course_id
     t.integer :group_id
   end
  end
end
