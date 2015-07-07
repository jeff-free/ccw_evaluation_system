# == Schema Information
#
# Table name: surveys
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  evalution_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
