class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :evaluation, index: true
      t.references :interpellation, index: true

      t.timestamps null: false
    end
  end
end
