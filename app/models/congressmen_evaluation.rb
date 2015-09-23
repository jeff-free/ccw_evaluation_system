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

class CongressmenEvaluation < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :congressman
  belongs_to :party
  belongs_to :party_group
  belongs_to :committee

  enum election_type: ["regional", "at_large"]
  delegate :full_name, to: :evaluation
end
