class CreateCourseInterpellations < ActiveRecord::Migration
  def change
    create_table :course_interpellations do |t|
      t.references :course, index: true
      t.references :interpellation, index: true

      t.timestamps null: false
    end
  end
end
