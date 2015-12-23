# == Schema Information
#
# Table name: surveys
#
#  id                                            :integer          not null, primary key
#  user_id                                       :integer
#  evaluation_id                                 :integer
#  created_at                                    :datetime         not null
#  updated_at                                    :datetime         not null
#  inquiry_id                                    :integer
#  user_role                                     :string
#  impression_before_and_after_watching_inquiry  :text
#  comment_to_the_congressman                    :text
#  whether_to_recommend_the_inquiry              :text
#  whether_inclusion_of_unappropriate_conversion :text
#  suggestion_of_survey                          :text
#

class Survey < ActiveRecord::Base
  belongs_to :user
  belongs_to :evaluation
  belongs_to :inquiry
  has_many :answers
  accepts_nested_attributes_for :answers
end
