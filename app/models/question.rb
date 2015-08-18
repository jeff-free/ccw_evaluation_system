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

class Question < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :question_type
end
