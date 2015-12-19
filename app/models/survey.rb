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
#  user_role                                     :string(255)
#  impression_before_and_after_watching_inquiry  :text(65535)
#  comment_to_the_congressman                    :text(65535)
#  whether_to_recommend_the_inquiry              :text(65535)
#  whether_inclusion_of_unappropriate_conversion :text(65535)
#  suggestion_of_survey                          :text(65535)
#

class Survey < ActiveRecord::Base
  belongs_to :user
  belongs_to :evaluation
  belongs_to :inquiry
  has_many :answers
  accepts_nested_attributes_for :answers
end
