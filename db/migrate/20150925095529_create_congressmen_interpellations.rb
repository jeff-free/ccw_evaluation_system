class CreateCongressmenInterpellations < ActiveRecord::Migration
  def change
    create_table :congressmen_interpellations do |t|
      t.integer :congressman_id, foreign_key: true, index: true
      t.integer :interpellation_id, foreign_key: true, index: true
      
      t.timestamps null: false
    end
  end
end
