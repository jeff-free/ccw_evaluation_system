# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  name             :string
#  question_type_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  evaluation_id    :integer
#

class Question < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :question_type
  default_scope ->{order(question_type_id: :asc)}
end
