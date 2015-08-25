class CreateCongressmenEvaluations < ActiveRecord::Migration
  def change
    create_table :congressmen_evaluations do |t|
      t.references :evaluation, index: true, foreign_key: true
      t.references :congressman, index: true, foreign_key: true
      t.references :party, index: true, foreign_key: true
      t.references :party_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
