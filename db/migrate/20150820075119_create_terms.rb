class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :term_number, index: true

      t.timestamps null: false
    end
  end
end
