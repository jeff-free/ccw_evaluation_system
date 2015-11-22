# == Schema Information
#
# Table name: inquiries
#
#  id                :integer          not null, primary key
#  number            :integer
#  content           :text(65535)
#  video             :text(65535)
#  congressman_id    :integer
#  interpellation_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Inquiry < ActiveRecord::Base
  belongs_to :congressman
  belongs_to :interpellation
  has_many :surveys
  has_many :answers, through: :surveys
  delegate :evaluation, to: :interpellation
  delegate :interpellation_date, to: :interpellation

  # TODO: don't use scope if this is not chainable.
  scope :in_current_evaluation, ->(evaluation){evaluation.interpellations.map(&:inquiries).flatten}

  def name
    "#{number} - #{content}"
  end
end
