# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  survey_id   :integer
#  point       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_answers_on_point        (point)
#  index_answers_on_question_id  (question_id)
#  index_answers_on_survey_id    (survey_id)
#

class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :survey
end
