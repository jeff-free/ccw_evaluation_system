class AddCommitteeTypeToCommittee < ActiveRecord::Migration
  def change
    add_column :committees, :committee_type, :integer, index: true, default: 1, after: :name
  end
end
