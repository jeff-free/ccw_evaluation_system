# == Schema Information
#
# Table name: evalution_sets
#
#  id           :integer          not null, primary key
#  evalution_id :integer
#  question_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class EvalutionSetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
