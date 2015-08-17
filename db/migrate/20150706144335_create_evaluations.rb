class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.references :legislative_session

      t.timestamps null: false
    end
  end
end
