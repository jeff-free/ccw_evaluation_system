class AddCourseIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :course, index: true
  end
end
