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

class CongressmenEvaluation < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :congressman
  belongs_to :party
  belongs_to :party_group
  belongs_to :committee

  enum election_type: ["regional", "at_large"]
  delegate :full_name, to: :evaluation

  validates_uniqueness_of :evaluation_id, scope: :congressman_id
  validates_presence_of :evaluation_id, :election_type, :committee_id, :party_id, :party_group_id

end
