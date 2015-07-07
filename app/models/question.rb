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
  has_many :evalution_sets
  has_many :evalutions, through: :evalution_sets
  belongs_to :question_type
end
