class AddTokenToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :token, :string
    add_index :courses, :token
  end
end
