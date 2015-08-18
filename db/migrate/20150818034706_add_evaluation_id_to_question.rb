class AddEvaluationIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :evaluation_id, :integer
    add_index :questions, :evaluation_id
  end
end
