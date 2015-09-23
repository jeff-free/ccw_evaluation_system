class AddReferenceCommitteeCongressmenEvaluation < ActiveRecord::Migration
  def change
    add_reference :congressmen_evaluations, :committee, index: true, after: :party_id
    add_foreign_key :congressmen_evaluations, :committees
  end
end
