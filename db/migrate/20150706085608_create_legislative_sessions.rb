class CreateLegislativeSessions < ActiveRecord::Migration
  def change
    create_table :legislative_sessions do |t|
      t.integer :year
      t.integer :session_number

      t.timestamps null: false
    end
  end
end
