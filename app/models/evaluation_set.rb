# == Schema Information
#
# Table name: evaluation_sets
#
#  id            :integer          not null, primary key
#  evaluation_id :integer
#  question_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class EvaluationSet < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :question
end
