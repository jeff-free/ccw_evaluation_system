# == Schema Information
#
# Table name: question_types
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class QuestionType < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :evaluations, through: :questions
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
