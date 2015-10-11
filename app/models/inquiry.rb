# == Schema Information
#
# Table name: inquiries
#
#  id                            :integer          not null, primary key
#  number                        :integer
#  content                       :text(65535)
#  video                         :text(65535)
#  congressmen_interpellation_id :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

class Inquiry < ActiveRecord::Base
  belongs_to :congressmen_interpellation
  delegate :congressman, to: :congressmen_interpellation
  delegate :interpellation, to: :congressmen_interpellation
  delegate :evaluation, to: :interpellation
  delegate :interpellation_date, to: :interpellation

  scope :in_current_evaluation, ->(evaluation){evaluation.interpellations.map(&:inquiries).flatten}

end
