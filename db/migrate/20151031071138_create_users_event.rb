class CreateUsersEvent < ActiveRecord::Migration
  def change
    create_table :users_events do |t|
      t.references :user, index: true
      t.references :event, index: true
    end
  end
end
