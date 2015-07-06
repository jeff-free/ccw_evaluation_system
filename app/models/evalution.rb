# == Schema Information
#
# Table name: evalutions
#
#  id                     :integer          not null, primary key
#  legislative_session_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Evalution < ActiveRecord::Base
  belongs_to :legislative_session
end
