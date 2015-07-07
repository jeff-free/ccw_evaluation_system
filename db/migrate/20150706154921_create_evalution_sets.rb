class CreateEvalutionSets < ActiveRecord::Migration
  def change
    create_table :evalution_sets do |t|
      t.references :evalution, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
