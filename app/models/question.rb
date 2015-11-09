# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  question_type_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  evaluation_id    :integer
#
# Indexes
#
#  index_questions_on_evaluation_id     (evaluation_id)
#  index_questions_on_question_type_id  (question_type_id)
#

class Question < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :question_type
  default_scope ->{order(question_type_id: :asc)}
end
