class AddRegistrationDataToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :integer
    add_column :users, :education, :integer
  end
end
