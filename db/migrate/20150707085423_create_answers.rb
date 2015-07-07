class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true, foreign_key: true
      t.references :survey, index: true, foreign_key: true
      t.integer :point, index: true

      t.timestamps null: false
    end
  end
end
