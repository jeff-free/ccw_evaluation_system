# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  question_type_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Question < ActiveRecord::Base
  has_and_belongs_to_many :evaluations
  belongs_to :question_type
end
