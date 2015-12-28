class RemoveCongressmenInterpellation < ActiveRecord::Migration
  def up
    drop_table :congressmen_interpellations
  end

  def down
    create_table :congressmen_interpellations do |t|
      t.integer :congressman_id, foreign_key: true, index: true
      t.integer :interpellation_id, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
