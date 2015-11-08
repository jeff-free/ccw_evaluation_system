class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :evaluation, index: true
      t.string :name

      t.timestamps null: false
    end
  end
end
