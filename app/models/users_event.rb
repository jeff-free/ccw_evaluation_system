# == Schema Information
#
# Table name: users_events
#
#  id       :integer          not null, primary key
#  user_id  :integer
#  event_id :integer
#
# Indexes
#
#  index_users_events_on_event_id  (event_id)
#  index_users_events_on_user_id   (user_id)
#

class UsersEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
end
