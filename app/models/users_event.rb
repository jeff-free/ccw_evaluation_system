# == Schema Information
#
# Table name: users_events
#
#  id       :integer          not null, primary key
#  user_id  :integer
#  event_id :integer
#

class UsersEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
end
