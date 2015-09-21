class AddElectionTypeToCongressmenEvaluations < ActiveRecord::Migration
  def change
    add_column :congressmen_evaluations, :election_type, :integer, default: 0, after: :congressman_id
  end
end
