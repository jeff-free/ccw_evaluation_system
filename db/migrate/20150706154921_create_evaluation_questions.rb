class CreateEvaluationQuestions < ActiveRecord::Migration
  def change
    create_table :evaluations_questions do |t|
      t.references :evaluation, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
