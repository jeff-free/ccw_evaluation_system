class CreateInterpellations < ActiveRecord::Migration
  def change
    create_table :interpellations do |t|
      t.string :name
      t.datetime :interpellation_date
      t.text :content
      t.references :committee, index: true, foreign_key: true
      t.references :evaluation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
