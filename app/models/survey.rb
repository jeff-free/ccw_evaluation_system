# == Schema Information
#
# Table name: surveys
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  evaluation_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Survey < ActiveRecord::Base
  belongs_to :user
  belongs_to :evaluation
  has_many :answers
  accepts_nested_attributes_for :answers
end
