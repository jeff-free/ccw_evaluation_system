class AddUserRoleToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :user_role, :string
    add_index :surveys, :user_role
  end
end
