# == Schema Information
#
# Table name: congressmen_evaluations
#
#  id             :integer          not null, primary key
#  evaluation_id  :integer
#  congressman_id :integer
#  party_id       :integer
#  party_group_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  election_type  :integer          default(0)
#

require 'test_helper'

class CongressmenEvaluationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
