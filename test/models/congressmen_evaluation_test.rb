# == Schema Information
#
# Table name: congressmen_evaluations
#
#  id             :integer          not null, primary key
#  evaluation_id  :integer
#  congressman_id :integer
#  election_type  :integer          default(0)
#  party_id       :integer
#  committee_id   :integer
#  party_group_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_congressmen_evaluations_on_committee_id    (committee_id)
#  index_congressmen_evaluations_on_congressman_id  (congressman_id)
#  index_congressmen_evaluations_on_evaluation_id   (evaluation_id)
#  index_congressmen_evaluations_on_party_group_id  (party_group_id)
#  index_congressmen_evaluations_on_party_id        (party_id)
#

require 'test_helper'

class CongressmenEvaluationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
