# == Schema Information
#
# Table name: course_interpellations
#
#  id                :integer          not null, primary key
#  course_id         :integer
#  interpellation_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class CourseInterpellation < ActiveRecord::Base
  belongs_to :course
  belongs_to :interpellation
end
