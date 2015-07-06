class CreateEvalutions < ActiveRecord::Migration
  def change
    create_table :evalutions do |t|
      t.references :legislative_session

      t.timestamps null: false
    end
  end
end
