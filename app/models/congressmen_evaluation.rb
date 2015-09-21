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

class CongressmenEvaluation < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :congressman
  belongs_to :party
  belongs_to :party_group

  enum election_type: ["regional", "at_large"]
end
