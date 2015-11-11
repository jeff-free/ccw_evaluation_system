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
# Indexes
#
#  index_course_interpellations_on_course_id          (course_id)
#  index_course_interpellations_on_interpellation_id  (interpellation_id)
#

require 'test_helper'

class CourseInterpellationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
