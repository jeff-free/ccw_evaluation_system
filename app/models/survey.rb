# == Schema Information
#
# Table name: surveys
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  evaluation_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  inquiry_id    :integer
#
# Indexes
#
#  index_surveys_on_evaluation_id  (evaluation_id)
#  index_surveys_on_inquiry_id     (inquiry_id)
#  index_surveys_on_user_id        (user_id)
#

class Survey < ActiveRecord::Base
  belongs_to :user
  belongs_to :evaluation
  belongs_to :inquiry
  has_many :answers
  accepts_nested_attributes_for :answers
end
