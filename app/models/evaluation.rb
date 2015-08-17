# == Schema Information
#
# Table name: evalutions
#
#  id                     :integer          not null, primary key
#  legislative_session_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Evaluation < ActiveRecord::Base
  has_many :evaluation_sets
  has_many :questions, through: :evalution_sets
  belongs_to :legislative_session
end
