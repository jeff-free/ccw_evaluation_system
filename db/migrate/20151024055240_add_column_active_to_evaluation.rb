class AddColumnActiveToEvaluation < ActiveRecord::Migration
  def change
    add_column :evaluations, :active, :boolean, default: false
  end
end
