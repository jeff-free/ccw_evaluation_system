class RemoveEvaluationYearColumn < ActiveRecord::Migration
  def change
    remove_column :evaluations, :year, :integer
    add_reference :evaluations, :term, index: true, foreign_key: true, after: :id
  end
end
