class DropEvaluationsQuestions < ActiveRecord::Migration
  def up
    drop_table :evaluations_questions
  end

  def down
    create_table :evaluations_questions do |t|
      t.references :evaluation, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
