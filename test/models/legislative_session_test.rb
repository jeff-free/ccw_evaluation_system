# == Schema Information
#
# Table name: legislative_sessions
#
#  id             :integer          not null, primary key
#  year           :integer
#  session_number :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class LegislativeSessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
