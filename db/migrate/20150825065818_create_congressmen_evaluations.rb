class CreateCongressmenEvaluations < ActiveRecord::Migration
  def change
    create_table :congressmen_evaluations do |t|
      t.references :evaluation, index: true
      t.references :congressman, index: true
      t.references :party, index: true
      t.references :party_group, index: true

      t.timestamps null: false
    end
  end
end
