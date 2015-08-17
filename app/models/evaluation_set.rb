# == Schema Information
#
# Table name: evalution_sets
#
#  id           :integer          not null, primary key
#  evalution_id :integer
#  question_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class EvaluationSet < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :question
end
