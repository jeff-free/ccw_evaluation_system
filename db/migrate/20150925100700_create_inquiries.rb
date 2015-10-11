class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.integer :number
      t.text :content
      t.text :video
      t.references :congressmen_interpellation, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
