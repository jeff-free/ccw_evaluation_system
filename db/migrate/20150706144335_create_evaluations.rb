class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :year
      t.integer :session_number

      t.timestamps null: false
    end
  end
end
